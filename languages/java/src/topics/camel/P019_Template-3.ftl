<html>
<head>
  <title>${headers.title}</title>
</head>
<body>
    <h1>${headers.title}</h1>

    <p>${headers.dataObject.name} by ${headers.dataObject.developer}</p>

    <ul>
        <#list headers.listOfDataObjects as dataObject>
          <li>${dataObject_index + 1}. ${dataObject.name} from ${dataObject.developer}</li>
        </#list>
    </ul>
</body>
</html>