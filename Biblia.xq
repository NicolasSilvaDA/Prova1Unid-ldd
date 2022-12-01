<html>
  <head>
    <title>Tabela - Bíblia</title>
  </head>
  <body>
    <table>
      <thead>
        <tr>
          <th>Livro</th>
          <th>Capítulo</th>
          <th>Qtd de Versos</th>
        </tr>
      </thead>
      <tbody>
       {
           let $capitulos := 
            for $bookCap in //book/c
            return <book nome="{$bookCap/../@name/string()}" cap="{$bookCap/@n}" qtdVers="{count($bookCap//v)}" />
            
            for $livro in //book
            let $capitulos := for $capitulo in $livro/c
              order by $livro/@chapters descending
              return
              <tr>
                <td>{$capitulo/@n/string()}</td>
                <td>{count(//$capitulo/v)}</td>
              </tr>
            return
            <tr>
              <td rowspan="{$livro/@chapters}">{$livro/@name}</td>
              {$capitulos}
            </tr>
        }
      </tbody>
    </table>
  </body>
</html>