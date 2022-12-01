let $biblia := (doc("Biblia.xml")/bible)
return
<table><thead><tr>
<th>Livro</th>
<th>Capítulo Mais Longo</th>
<th>Qtd de Versos</th></tr></thead>
<tbody>
       {    
            for $livro in //$biblia/book
            let $capitulos := for $capitulo in $livro/c
              order by $livro/@chapters descending
              return <cap n="{$capitulo/@n/string()}" qtdVers="{count(//$capitulo/v)}"/>
            let $capMaisVers := max(//$capitulos/@qtdVers)
            let $capMaisN := $capitulos/@n[../@qtdVers = $capMaisVers]/string()
            return 
            <tr>
              <td>{$livro/@name/string()}</td>
              <td>{$capMaisN}</td>
              <td>{$capMaisVers}</td>
            </tr>
        }
</tbody></table>