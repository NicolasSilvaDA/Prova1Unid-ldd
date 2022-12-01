let $biblia := doc("Biblia.xml")
return
<table>
  <thead>
    <tr>
      <th>Livro</th>
      <th>Capítulo</th>
      <th>Qtd de Versos</th></tr></thead>
  <tbody>
       {   
            for $livro in //$biblia/bible/book
            let $capMaiorVers := max($livro/c/v/@n)
            let $capMaiorN := $livro/c[v/@n = $capMaiorVers]/@n/string()
            
            let $rowInicial := 
              <tr>
                <td rowspan="{$livro/@chapters}">{$livro/@name/string()}</td>
                <td>{$capMaiorN}</td>
                <td>{$capMaiorVers}</td>
              </tr>
            
            let $capitulos := for $capitulo in $livro/c
              let $capOrdem := max($capitulo/v/@n)
              order by $capOrdem descending
              return if ($capitulo/@n/string() != $capMaiorN)
              then
                <tr>
                  <td>{$capitulo/@n[../v/@n = $capOrdem]/string()}</td>
                  <td>{$capOrdem}</td>
                </tr>
              else ()
            
            return ($rowInicial, $capitulos)
        }
  </tbody>
</table>