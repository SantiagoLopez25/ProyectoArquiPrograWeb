<template>
    <div class="product-section" id="#product-section">
    <div class="container">
      <div class="row">
        <!-- Start Column 1 -->
        <div class="col-md-12 col-lg-3 mb-5 mb-lg-0">
          <h2 class="mb-4 section-title">Productos de la más alta tecnología</h2>
          <p class="mb-4">
            Con nosotros encuentras los productos y tecnologías que necesitas al mejor precio
            y con la más alta calidad
          </p>
          <RouterLink class="btn btn-black btn-lg py-3 btn-block" to="/shop">Comprar</RouterLink>
        </div>
        <!-- End Column 1 -->

        <!-- Start Column 2 -->
        <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
          <a class="product-item" >
            <img src="https://walmartgt.vtexassets.com/arquivos/ids/266640/Laptop-HP-Gamin-15-R5-8Gb-256Gb-15Ec1025-2-44461.jpg?v=637871997956200000" class="img-fluid product-thumbnail" />
            <h3 class="product-title">Laptop Gamer HP</h3>
            <RouterLink to="/shop"> <strong class="product-price">Q5000.00</strong> </RouterLink>

            <span class="icon-cross">
              <img src="@/assets/images/cross.svg" class="img-fluid" />
            </span>
          </a>
        </div>
        <!-- End Column 2 -->

        <!-- Start Column 3 -->
        <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
          <a class="product-item" >
            <img src="https://elektragt.vtexassets.com/arquivos/ids/195138/Audifonos-Sony-WH-CH520B-4003397--2-.jpg?v=638476786217930000" class="img-fluid product-thumbnail" />
            <h3 class="product-title">Sony WCH-520</h3>
            <RouterLink to="/shop"><strong class="product-price">Q400.00</strong></RouterLink>

            <span class="icon-cross">
              <img src="@/assets/images/cross.svg" class="img-fluid" />
            </span>
          </a>
        </div>
        <!-- End Column 3 -->

        <!-- Start Column 4 -->
        <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
          <a class="product-item" >
            <img src="https://images.samsung.com/latin/smartphones/galaxy-s24-ultra/images/galaxy-s24-ultra-highlights-color-titanium-yellow-back-mo.jpg?imbypass=true" class="img-fluid product-thumbnail" />
            <h3 class="product-title">Samsung Galaxy s24-Ultra</h3>
          <RouterLink to="/shop"> <strong class="product-price">Q.15000</strong></RouterLink>

            <span class="icon-cross">
              <img src="@/assets/images/cross.svg" class="img-fluid" />
            </span>
          </a>
        </div>
        <!-- End Column 4 -->
      </div>
    </div>
  </div>
</template>