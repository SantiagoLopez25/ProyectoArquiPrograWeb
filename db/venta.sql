DROP PROCEDURE IF EXISTS guardarVenta;

DELIMITER $$


CREATE PROCEDURE guardarVenta (
    IN montoTotal DECIMAL(18,2),
    IN idSucursal INT,
    IN detalleFactura JSON,
    IN idCliente INT,
    IN nombreCliente VARCHAR(75),
    IN direccion VARCHAR(100),
    OUT mensaje VARCHAR(100)
)
ventaSP: BEGIN 
    DECLARE i INT DEFAULT 0;
    DECLARE lenght INT DEFAULT 0;
    DECLARE idFactura INT;
    DECLARE idProducto INT;
    DECLARE cantidad INT;
    DECLARE idOtraSucursal INT;
    DECLARE serie VARCHAR(10) DEFAULT 'A-01';
    
    -- Manejador de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET mensaje = 'Error en la transacción';
    END;

    -- Iniciar la transacción
    START TRANSACTION;

    -- Validar si el detalle de la factura es nulo o vacío
    SET lenght = JSON_LENGTH(detalleFactura);
    IF detalleFactura IS NULL OR lenght = 0 THEN
        SET mensaje = 'No se asignaron productos a la venta';
        ROLLBACK;
        LEAVE ventaSP;
    END IF;

    -- Insertar cliente si idCliente es 0
    IF idCliente = 0 THEN
        INSERT INTO cliente (nombre, direccion, estado)
        VALUES (nombreCliente, direccion, 1);
        SET idCliente = LAST_INSERT_ID();
    END IF;

    -- Insertar la factura
    INSERT INTO Factura (fechaFactura, montoTotal, idCliente, idSerie)
    VALUES (NOW(), montoTotal, idCliente, 'A-01');
    SET idFactura = LAST_INSERT_ID();

    -- Procesar cada producto en el JSON de detalleFactura
    WHILE i < lenght DO 
        -- Obtener idProducto y cantidad del JSON
        SET idProducto = CAST(JSON_UNQUOTE(JSON_EXTRACT(detalleFactura, CONCAT('$[', i, '].idProducto'))) AS INT);
        SET cantidad = CAST(JSON_UNQUOTE(JSON_EXTRACT(detalleFactura, CONCAT('$[', i, '].cantidad'))) AS INT);

        -- Verificar si hay suficiente stock en la sucursal
        IF (SELECT cantidad FROM rproductosucursal WHERE idSucursal = idSucursal AND idProducto = idProducto) < cantidad THEN
            -- Buscar en otra sucursal si no hay suficiente stock
            IF (SELECT MAX(cantidad) FROM rproductosucursal WHERE idProducto = idProducto) < cantidad THEN
                SET mensaje = CONCAT('Existencias insuficientes para el producto con id: ', idProducto);
                ROLLBACK;
                LEAVE ventaSP;
            END IF;

            SET idOtraSucursal = (SELECT idSucursal FROM rproductosucursal WHERE idProducto = idProducto ORDER BY cantidad DESC LIMIT 1);

            -- Insertar en detallefactura y actualizar stock en otra sucursal
            INSERT INTO detallefactura (cantidad, idFactura, idSerie, idProducto)
            VALUES (cantidad, idFactura, serie, idProducto);

            UPDATE rproductosucursal 
            SET cantidad = cantidad - cantidad
            WHERE idProducto = idProducto AND idSucursal = idOtraSucursal;
        ELSE
            -- Insertar en detallefactura y actualizar stock en la misma sucursal
            INSERT INTO detallefactura (cantidad, idFactura, idSerie, idProducto)
            VALUES (cantidad, idFactura, serie, idProducto);

            UPDATE rproductosucursal 
            SET cantidad = cantidad - cantidad
            WHERE idProducto = idProducto AND idSucursal = idSucursal;
        END IF;

        SET i = i + 1;
    END WHILE;

    -- Finalizar la transacción
    SET mensaje = 'Venta realizada correctamente';
    COMMIT;
END$$

DELIMITER ;
