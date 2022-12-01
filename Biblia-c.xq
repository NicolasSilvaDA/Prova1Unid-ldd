let $biblia := (doc("Biblia.xml")/bible)
return
<table>
  <thead>
    <tr>
      <th>Livro</th>
      <th>Capítulo Mais Longo</th>
      <th>Qtd de Versos</th>
    </tr>
  </thead>
  <tbody>
       {    
            for $livro in //$biblia/book
            let $capMaiorVers := max($livro/c/v/@n)
            let $capMaiorN := $livro/c[v/@n = $capMaiorVers]/@n/string()
            return 
            <tr>
              <td>{$livro/@name/string()}</td>
              <td>{$capMaiorN}</td>
              <td>{$capMaiorVers}</td>
            </tr>
        }
  </tbody>
</table>