<!-- students_transform.xsl -->
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Аттестация студентов</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
          }
          h1 {
            color: #2c3e50;
            text-align: center;
            padding-bottom: 15px;
            border-bottom: 2px solid #3498db;
          }
          table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            background-color: white;
          }
          th {
            background-color: #3498db;
            color: white;
            padding: 12px;
            text-align: center;
            font-weight: bold;
          }
          td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
          }
          .low-grade {
            background-color: #ffcccc !important;
            font-weight: bold;
          }
          .high-grade {
            background-color: #ccffcc !important;
            font-weight: bold;
          }
          .student-header {
            background-color: #e8f4fc;
            font-weight: bold;
          }
          .average-cell {
            font-weight: bold;
            background-color: #f0f0f0;
          }
          .footer {
            margin-top: 30px;
            text-align: center;
            color: #7f8c8d;
            font-style: italic;
          }
        </style>
      </head>
      <body>
        <h1>Результаты аттестации студентов</h1>
        
        <table>
          <thead>
            <tr>
              <th rowspan="2">№</th>
              <th rowspan="2">Фамилия</th>
              <th rowspan="2">Имя</th>
              <th rowspan="2">Группа</th>
              <th colspan="5">Оценки по предметам</th>
              <th rowspan="2">Средний балл</th>
            </tr>
            <tr>
              <th>Математика</th>
              <th>Физика</th>
              <th>Программирование</th>
              <th>Базы данных</th>
              <th>Английский язык</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="students/student">
              <xsl:sort select="average" data-type="number" order="descending"/>
              <tr>
                <td class="student-header">
                  <xsl:value-of select="position()"/>
                </td>
                <td class="student-header">
                  <xsl:value-of select="last_name"/>
                </td>
                <td class="student-header">
                  <xsl:value-of select="first_name"/>
                </td>
                <td class="student-header">
                  <xsl:value-of select="group"/>
                </td>
                
                <!-- Математика -->
                <td>
                  <xsl:variable name="mathGrade" select="subjects/subject[name='Математика']/grade"/>
                  <xsl:attribute name="class">
                    <xsl:choose>
                      <xsl:when test="$mathGrade &lt; 4">low-grade</xsl:when>
                      <xsl:when test="$mathGrade &gt; 8">high-grade</xsl:when>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:value-of select="$mathGrade"/>
                </td>
                
                <!-- Физика -->
                <td>
                  <xsl:variable name="physicsGrade" select="subjects/subject[name='Физика']/grade"/>
                  <xsl:attribute name="class">
                    <xsl:choose>
                      <xsl:when test="$physicsGrade &lt; 4">low-grade</xsl:when>
                      <xsl:when test="$physicsGrade &gt; 8">high-grade</xsl:when>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:value-of select="$physicsGrade"/>
                </td>
                
                <!-- Программирование -->
                <td>
                  <xsl:variable name="progGrade" select="subjects/subject[name='Программирование']/grade"/>
                  <xsl:attribute name="class">
                    <xsl:choose>
                      <xsl:when test="$progGrade &lt; 4">low-grade</xsl:when>
                      <xsl:when test="$progGrade &gt; 8">high-grade</xsl:when>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:value-of select="$progGrade"/>
                </td>
                
                <!-- Базы данных -->
                <td>
                  <xsl:variable name="dbGrade" select="subjects/subject[name='Базы данных']/grade"/>
                  <xsl:attribute name="class">
                    <xsl:choose>
                      <xsl:when test="$dbGrade &lt; 4">low-grade</xsl:when>
                      <xsl:when test="$dbGrade &gt; 8">high-grade</xsl:when>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:value-of select="$dbGrade"/>
                </td>
                
                <!-- Английский язык -->
                <td>
                  <xsl:variable name="engGrade" select="subjects/subject[name='Английский язык']/grade"/>
                  <xsl:attribute name="class">
                    <xsl:choose>
                      <xsl:when test="$engGrade &lt; 4">low-grade</xsl:when>
                      <xsl:when test="$engGrade &gt; 8">high-grade</xsl:when>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:value-of select="$engGrade"/>
                </td>
                
                <!-- Средний балл -->
                <td class="average-cell">
                  <xsl:value-of select="format-number(average, '0.0')"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        
        <div class="footer">
          Всего студентов: <xsl:value-of select="count(students/student)"/>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>