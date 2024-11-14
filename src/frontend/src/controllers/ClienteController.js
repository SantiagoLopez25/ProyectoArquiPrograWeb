import axios from 'axios';
class ClienteController {
  constructor(server) {
    this.url = `${server}/api/cliente-contacto`;
  }

  //Registro de clientes y contacto asociado al cliente
  async registrarCliente(datos) {
    try {
      const response = await axios.post(this.url, datos);
      return response.data;
    } catch (error) {
      console.error('Error al registrar cliente:', error);
      throw error;
    }
  }

}

export default ClienteController;
