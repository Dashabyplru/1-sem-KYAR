<!-- shop_sorted.xsl -->
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Магазин Anna Asti - Товары отсортированные по цене</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            padding: 20px;
          }
          h1 {
            color: #8a2be2;
            border-bottom: 2px solid #8a2be2;
            padding-bottom: 10px;
          }
          h2 {
            color: #333;
          }
          .shop-info {
            font-style: italic;
            color: #666;
            margin-bottom: 30px;
          }
          .product {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            margin: 15px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            border-left: 5px solid #8a2be2;
          }
          .product-name {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
          }
          .category {
            display: inline-block;
            background-color: #e6e6fa;
            color: #8a2be2;
            padding: 3px 8px;
            border-radius: 5px;
            font-size: 14px;
            margin-bottom: 10px;
          }
          .price {
            color: #d2691e;
            font-size: 18px;
            font-weight: bold;
            margin: 5px 0;
          }
          .quantity {
            color: #2e8b57;
            margin: 5px 0;
          }
          .rating {
            color: #ff8c00;
            font-weight: bold;
            margin-top: 10px;
          }
        </style>
      </head>
      <body>
        <h1>
          Магазин: <xsl:value-of select="shop/@name"/> | 
          Категория: <xsl:value-of select="shop/@category"/>
        </h1>
        <div class="shop-info">
          <xsl:value-of select="shop/description"/>
        </div>
        
        <h2>Товары (отсортированы по цене по возрастанию):</h2>
        
        <xsl:for-each select="shop/product">
          <xsl:sort select="price" data-type="number" order="ascending"/>
          <div class="product">
            <div class="product-name">
              <xsl:value-of select="name"/> (ID: <xsl:value-of select="@id"/>)
            </div>
            <div class="category">
              <xsl:value-of select="category"/>
            </div>
            <div class="price">
              Цена: <xsl:value-of select="price"/> <xsl:value-of select="price/@currency"/>
            </div>
            <div class="quantity">
              В наличии: <xsl:value-of select="quantity"/> шт.
            </div>
            <div>
              <xsl:value-of select="description"/>
            </div>
            <xsl:if test="release_year">
              <div>Год выпуска: <xsl:value-of select="release_year"/></div>
            </xsl:if>
            <xsl:if test="sizes">
              <div>Размеры: <xsl:value-of select="sizes"/></div>
            </xsl:if>
            <xsl:if test="material">
              <div>Материал: <xsl:value-of select="material"/></div>
            </xsl:if>
            <xsl:if test="concert_date">
              <div>Дата концерта: <xsl:value-of select="concert_date"/></div>
            </xsl:if>
            <xsl:if test="location">
              <div>Место: <xsl:value-of select="location"/></div>
            </xsl:if>
            <div class="rating">
              Рейтинг: <xsl:value-of select="rating"/>/5.0
            </div>
          </div>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>