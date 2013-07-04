Regex Matching
O que são regexes, como funcionam e exemplos práticos

O que são regexes

  Regex servem para encontrar padrões dentro de strings. 

Quando usar regex ?

  Caso 1: 

  Listar todos os emails que aparecem no meio de um texto gigante
  
  É fornecido um texto enorme com várias informações e no meio dessas informações são mencionados alguns emails. 
  Tarefa: Localizar e listar todos esses emails

  Caso 2:

  É fornecida uma lista com "nome - data aniversário - idade -- email"
    Nome Completo --  02/02/1980 --- 33 anoos - email@algo.com
    Nome Completo ----  02/02/1980 - 33 anooos --- email@algo.com
    Nome Completo ---  02/02/1980 ---- 33 aaanos ---- email@algo.com
  A pessoa que digitava essa lista escrevia "anos" errado, e você tem que arrumar isso. Tem que transformar "anoos" em "anos", e , "aaaanos" em "anos" e assim sucessivamente.
  Além disso é necessário mudar a ordem dos campos, agora vai ser:
    "email, nome, idade, data aniversário"
  OBS: perceba que os - (traços) as vezes se repetem 1 ou mais vezes

Como identificar uma regex ?

  Assim como as strings são representadas por "texto" ou 'texto'
  Normalmente as regex são identificáveis por /regex/ ou /regex/substituicao/ 
  No caso de // (duas barras) 
    Normalmente é utilizada para localizar padrões de texto dentro de um texto.
    Exemplo de uso: 
        /joao/      vai procurar joao em uma string
        /joao/i     vai procurar joao em uma string, com case Insensitive (tratando maisculas e minusculas como similares)
        /joao/ig    vai procurar todas as ocorrências de joao dentro de uma string
       m/joao/ig    em perl, o m no começo indica que é pra fazer Match
  No caso de /// (tres barras)
    Normalmente é utilizada para fazer substituição. praticamente: /substituir isto/por isto/
       s/texto ou regex para localizar/texto para substituir/ig
    Exemplo de uso:
        /isto/por aquilo/     substitui a primeira ocorrência
        /isto/por aquilo/i    case Insensitive
        /isto/por aquilo/ig   case Insensitive + global
       s/isto/por aquilo/ig

  Uso de regex para substituição te texto em perl:
    
    $var = "Algum texto qualquer"
    $var =~ s/Algum texto/Alguma regex/; #substituição

    print $var:

    Alguma regex qualquer

  Uso de regex para localização de string em um texto em perl:

    $var = "Algum texto qualquer";
    print "encontrou texto" if $var =~ m/texto/ig;

Componentes de uma Regex:

- Modificadores
- Metacharacteres

    \ Escapa o próximo caractere, utilizado para procurar uma / por exemplo
    ^ Linha começando em
    . Qualquer caractere exceto nova linha
    $ Final da linha
    | Ou
    () Agrupamento
    [] Caracretes dentro de colchetes

- Quantificadores

    * 0 ou mais vezes
    + 1 ou mais vezes
    ? 1 ou 0 vezes (opcional)
    {N} exatamente N vezes
    {N,} pelo menos N vezes
    {N,M} pelo menos N vezes mas não mais que M vezes

    *? 0 ou mais vezes, não greedily
    +? 1 ou mais vezes, não greedily
    ?? 1 ou 0 vezes, not greedily
    {n}? exatamente N vezes, not greedily (redundant)
    {n,}? pelo menos N vezes, not greedily
    {n,m}? pelo menos N vezes mas não mais que M vezes, not greedily

    *+ Match 0 or more times and give nothing back
    ++ Match 1 or more times and give nothing back
    ?+ Match 0 or 1 time and give nothing back
    {n}+ Match exactly n times and give nothing back (redundant)
    {n,}+ Match at least n times and give nothing back
    {n,m}+ Match at least n but not more than m times and give nothing back

- Caracteres escapáveis

    \t tab (HT, TAB)
    \n newline (LF, NL)
    \r return (CR)
    \f form feed (FF)
    \a alarm (bell) (BEL)
    \e escape (think troff) (ESC)
    \cK control char (example: VT)
    \x{}, \x00 character whose ordinal is the given hexadecimal number
    \N{name} named Unicode character or character sequence
    \N{U+263D} Unicode character (example: FIRST QUARTER MOON)
    \o{}, \000 character whose ordinal is the given octal number
    \l lowercase next char (think vi)
    \u uppercase next char (think vi)
    \L lowercase till \E (think vi)
    \U uppercase till \E (think vi)
    \Q quote (disable) pattern metacharacters till \E
    \E end either case modification or quoted section, think vi

- Captura de Grupos
    (...)

Problemas do dia a dia:

  Solução para o Caso 1: 

Dado o texto abaixo, encontrar todos os emails nele contidos:

  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tincidunt ligula in accumsan congue. Fusce vel accumsan libero. Sed eget libero quis sapien hendrerit tristique id ut justo. Phasellus imperdiet, nulla eu pulvinar porta, purus enim condimentum diam, in posuere dolor nibh porta nibh. Vestibulum ante ipsum primis email1@paragraph1.com in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas a sapien in sem condimentum convallis. Vivamus ac libero nibh.
  Mauris malesuada augue semper, varius erat at, ornare erat. Fusce laoreet neque odio, a malesuada dolor adipiscing ac. Vestibulum vel euismod tortor. Nulla facilisi. Cras commodo ligula ut sapien adipiscing, id porttitor arcu eleifend. Pellentesque ac fermentum quam, eu varius sapien. Etiam ornare aliquet ante sit amet email2@paragraph2.com lacinia. Sed tempor nisl sit amet quam egestas posuere. Ut luctus email3@paragraph3.com ac turpis eget email4@paragraph4.com rhoncus. Nullam feugiat vehicula condimentum. Nunc et quam viverra, dignissim metus email5@paragraph5.com adipiscing, iaculis dolor. Donec nisl erat, lobortis vel facilisis ac, viverra eget nunc. Maecenas iaculis dictum dui, accumsan viverra lectus blandit quis.
  Phasellus pellentesque tellus a lacus condimentum dapibus. Sed euismod rhoncus felis vitae elementum. Cras vel vehicula tellus. Quisque iaculis diam a convallis facilisis. Nullam a ligula lacus. Morbi varius eleifend scelerisque. Integer nisl ligula, volutpat scelerisque dictum sed, cursus eget nisl. Nam non accumsan nunc. Pellentesque condimentum hendrerit nunc, sit amet dapibus urna tempus in.
  Vivamus nibh felis, consequat a arcu id, tincidunt pharetra quam. Nullam hendrerit dolor vitae turpis volutpat ornare. Cras non elit vel lorem vulputate vulputate. Vivamus placerat velit eu enim rhoncus tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nibh libero, accumsan sit amet accumsan et, semper et nisi. Proin malesuada lacus nec volutpat scelerisque. Mauris sit amet ante sed lorem ornare tempus ut sit amet nisi. Mauris quis cursus diam, id accumsan nisi. Vivamus ultricies purus ligula, vel dapibus lorem fringilla sed. Morbi at laoreet email6@paragraph6.com dui, id sagittis sem. Phasellus vel tristique nulla. Nam vitae egestas justo. Ut porta mollis nibh non commodo.
  Fusce leo urna, feugiat suscipit blandit non, tempus at magna. Nam mauris velit, scelerisque email7@paragraph7.com sed est sed, viverra posuere nulla. Ut semper facilisis odio eu tincidunt. email8@paragraph8.com Morbi et ante dolor. Morbi commodo libero euismod, lobortis nibh eu, malesuada lectus. Vivamus gravida at dui at gravida. Etiam malesuada quis elit fermentum iaculis. Sed non enim vel urna accumsan condimentum tempus eu elit.
  Phasellus quis dignissim dolor, vel tristique mauris. Praesent tempus lorem sed ipsum condimentum viverra. Pellentesque ut dolor eget augue venenatis bibendum at quis libero. Interdum et malesuada fames ac ante email9@paragraph9.com ipsum primis in faucibus. Nullam quis tortor in lorem ornare email10@paragraph10.com mollis. Curabitur aliquet lacinia tincidunt. Sed congue tristique sem mattis ullamcorper. Donec vitae adipiscing mi. Sed vitae eros eget leo fringilla interdum nec id lacus. Donec ut nisi condimentum, rutrum lectus in, dictum eros. Etiam et tincidunt purus, sed viverra mi. Quisque vitae dui nisl. Aenean sit amet nunc nec lorem venenatis bibendum. Cras fringilla pellentesque dui et rhoncus.
  Etiam varius venenatis tempor. Cras aliquet, metus et mollis accumsan, risus leo elementum elit, sit amet fringilla dolor nisl ac metus. Suspendisse lacinia nunc a volutpat egestas. Fusce vitae feugiat nunc. Proin imperdiet aliquet nunc, sed lacinia velit viverra ac. Suspendisse egestas suscipit email11@paragraph11.com lacus, et placerat est consectetur at. Curabitur eleifend felis in nulla fermentum luctus id vitae augue. Maecenas et sem sit amet felis pharetra porttitor. Duis tristique urna vel turpis ultrices pulvinar. Mauris nec adipiscing massa. Nam eu ante erat. Suspendisse aliquet mi nec eros pharetra aliquam eget quis libero.
  Nunc dignissim orci a tellus suscipit ultricies. Donec lacinia semper dapibus. Pellentesque tincidunt, dolor in malesuada sagittis, odio velit adipiscing nisl, non lacinia massa magna ut felis. Phasellus semper tristique fringilla. Ut non nulla gravida, sollicitudin est eget, tempor sapien. Suspendisse condimentum augue non nisi dictum, in condimentum enim tempus. Nulla pharetra metus blandit luctus commodo. Aenean eget mauris a massa elementum ornare quis vel ipsum.
  Quisque et pulvinar neque, nec porta turpis. Proin ac justo vel augue sollicitudin tempus id quis erat. In tortor sem, bibendum id leo non, ullamcorper aliquet augue. Sed adipiscing vitae diam ac malesuada. Integer dapibus rutrum lorem sed auctor. Vivamus nisl sapien, facilisis at nisi eu, feugiat pretium tortor. Nullam luctus feugiat gravida. Fusce quis euismod risus. Vestibulum augue diam, commodo eget lorem in, vehicula ornare eros. Etiam sollicitudin, dui ac ornare dignissim, metus elit viverra arcu, ut sagittis massa est id dolor.
  Duis et nibh non neque dignissim venenatis et eu odio. Vivamus sit amet blandit ante. Fusce cursus aliquet arcu, eget hendrerit velit egestas nec. Mauris scelerisque, arcu eget consectetur pulvinar, leo orci malesuada augue, vitae porttitor ligula enim fermentum libero. Nam vehicula urna sit amet est porttitor congue. Cras email12@paragraph12.com condimentum felis et ligula commodo accumsan. Praesent volutpat interdum dolor eu feugiat. Aliquam vel elit laoreet, sagittis mauris sed, cursus velit. 


  Solução com perl:

  my $texto = <<'END';
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tincidunt ligula in accumsan congue. Fusce vel accumsan libero. Sed eget libero quis sapien hendrerit tristique id ut justo. Phasellus imperdiet, nulla eu pulvinar porta, purus enim condimentum diam, in posuere dolor nibh porta nibh. Vestibulum ante ipsum primis email1@paragraph1.com in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas a sapien in sem condimentum convallis. Vivamus ac libero nibh.
    Mauris malesuada augue semper, varius erat at, ornare erat. Fusce laoreet neque odio, a malesuada dolor adipiscing ac. Vestibulum vel euismod tortor. Nulla facilisi. Cras commodo ligula ut sapien adipiscing, id porttitor arcu eleifend. Pellentesque ac fermentum quam, eu varius sapien. Etiam ornare aliquet ante sit amet email2@paragraph2.com lacinia. Sed tempor nisl sit amet quam egestas posuere. Ut luctus email3@paragraph3.com ac turpis eget email4@paragraph4.com rhoncus. Nullam feugiat vehicula condimentum. Nunc et quam viverra, dignissim metus email5@paragraph5.com adipiscing, iaculis dolor. Donec nisl erat, lobortis vel facilisis ac, viverra eget nunc. Maecenas iaculis dictum dui, accumsan viverra lectus blandit quis.
    Phasellus pellentesque tellus a lacus condimentum dapibus. Sed euismod rhoncus felis vitae elementum. Cras vel vehicula tellus. Quisque iaculis diam a convallis facilisis. Nullam a ligula lacus. Morbi varius eleifend scelerisque. Integer nisl ligula, volutpat scelerisque dictum sed, cursus eget nisl. Nam non accumsan nunc. Pellentesque condimentum hendrerit nunc, sit amet dapibus urna tempus in.
    Vivamus nibh felis, consequat a arcu id, tincidunt pharetra quam. Nullam hendrerit dolor vitae turpis volutpat ornare. Cras non elit vel lorem vulputate vulputate. Vivamus placerat velit eu enim rhoncus tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nibh libero, accumsan sit amet accumsan et, semper et nisi. Proin malesuada lacus nec volutpat scelerisque. Mauris sit amet ante sed lorem ornare tempus ut sit amet nisi. Mauris quis cursus diam, id accumsan nisi. Vivamus ultricies purus ligula, vel dapibus lorem fringilla sed. Morbi at laoreet email6@paragraph6.com dui, id sagittis sem. Phasellus vel tristique nulla. Nam vitae egestas justo. Ut porta mollis nibh non commodo.
    Fusce leo urna, feugiat suscipit blandit non, tempus at magna. Nam mauris velit, scelerisque email7@paragraph7.com sed est sed, viverra posuere nulla. Ut semper facilisis odio eu tincidunt. email8@paragraph8.com Morbi et ante dolor. Morbi commodo libero euismod, lobortis nibh eu, malesuada lectus. Vivamus gravida at dui at gravida. Etiam malesuada quis elit fermentum iaculis. Sed non enim vel urna accumsan condimentum tempus eu elit.
    Phasellus quis dignissim dolor, vel tristique mauris. Praesent tempus lorem sed ipsum condimentum viverra. Pellentesque ut dolor eget augue venenatis bibendum at quis libero. Interdum et malesuada fames ac ante email9@paragraph9.com ipsum primis in faucibus. Nullam quis tortor in lorem ornare email10@paragraph10.com mollis. Curabitur aliquet lacinia tincidunt. Sed congue tristique sem mattis ullamcorper. Donec vitae adipiscing mi. Sed vitae eros eget leo fringilla interdum nec id lacus. Donec ut nisi condimentum, rutrum lectus in, dictum eros. Etiam et tincidunt purus, sed viverra mi. Quisque vitae dui nisl. Aenean sit amet nunc nec lorem venenatis bibendum. Cras fringilla pellentesque dui et rhoncus.
    Etiam varius venenatis tempor. Cras aliquet, metus et mollis accumsan, risus leo elementum elit, sit amet fringilla dolor nisl ac metus. Suspendisse lacinia nunc a volutpat egestas. Fusce vitae feugiat nunc. Proin imperdiet aliquet nunc, sed lacinia velit viverra ac. Suspendisse egestas suscipit email11@paragraph11.com lacus, et placerat est consectetur at. Curabitur eleifend felis in nulla fermentum luctus id vitae augue. Maecenas et sem sit amet felis pharetra porttitor. Duis tristique urna vel turpis ultrices pulvinar. Mauris nec adipiscing massa. Nam eu ante erat. Suspendisse aliquet mi nec eros pharetra aliquam eget quis libero.
    Nunc dignissim orci a tellus suscipit ultricies. Donec lacinia semper dapibus. Pellentesque tincidunt, dolor in malesuada sagittis, odio velit adipiscing nisl, non lacinia massa magna ut felis. Phasellus semper tristique fringilla. Ut non nulla gravida, sollicitudin est eget, tempor sapien. Suspendisse condimentum augue non nisi dictum, in condimentum enim tempus. Nulla pharetra metus blandit luctus commodo. Aenean eget mauris a massa elementum ornare quis vel ipsum.
    Quisque et pulvinar neque, nec porta turpis. Proin ac justo vel augue sollicitudin tempus id quis erat. In tortor sem, bibendum id leo non, ullamcorper aliquet augue. Sed adipiscing vitae diam ac malesuada. Integer dapibus rutrum lorem sed auctor. Vivamus nisl sapien, facilisis at nisi eu, feugiat pretium tortor. Nullam luctus feugiat gravida. Fusce quis euismod risus. Vestibulum augue diam, commodo eget lorem in, vehicula ornare eros. Etiam sollicitudin, dui ac ornare dignissim, metus elit viverra arcu, ut sagittis massa est id dolor.
    Duis et nibh non neque dignissim venenatis et eu odio. Vivamus sit amet blandit ante. Fusce cursus aliquet arcu, eget hendrerit velit egestas nec. Mauris scelerisque, arcu eget consectetur pulvinar, leo orci malesuada augue, vitae porttitor ligula enim fermentum libero. Nam vehicula urna sit amet est porttitor congue. Cras email12@paragraph12.com condimentum felis et ligula commodo accumsan. Praesent volutpat interdum dolor eu feugiat. Aliquam vel elit laoreet, sagittis mauris sed, cursus velit. 
  END

  while ( $texto =~ m/(([^\s]+)\@([^\s]+))/gx ) {
    my $email = $1;
    print $email,"\n";
  }


  Solução para o Caso 2:

  Dada uma lista gigante assim:

  Maria da Silva - 30/12/1970 --- 30 anoos - mariana.da.silva@hotmail.com
  João Pereira ----- 22/11/1982 - 35 anooos --- joao.pereira@gmail.com
  Mariana Moura --- 07/02/1981 ---- 39 aaanos ---- mariana.moura@uol.com.br

  Trocar as posições e chegar em uma lista assim (email,nome,idade,data):

  mariana.da.silva@hotmail.com, Maria da Silva, 30 anos,  30/12/1970
  joao.pereira@gmail.com, João Pereira, 35 anos, 22/11/1982
  mariana.moura@uol.com.br, Mariana Moura, 39 anos, 07/02/1981

  Solução:

  my $var = <<'END';
  Maria da Silva - 30/12/1970 --- 30 anoos - mariana.da.silva@hotmail.com
  João Pereira ----- 22/11/1982 - 35 anooos --- joao.pereira@gmail.com
  Mariana Moura --- 07/02/1981 ---- 39 aaanos ---- mariana.moura@uol.com.br
  END

  print $var;
  my $new_var;
  while ( $var =~ m/(.+) -{1,} (\d{2}\/\d{2}\/\d{4}) -{1,} (\d+) [a]{1,}[n]{1,}[o]{1,}[s]{1,} -{1,} (.+)/g ) {
    $new_var .= "$4, $1, $3 anos, $4\n";
  }

  print $new_var;


  Explicação da regex utilizada:

  Dadas as linhas de texto que eu vou analisar, eu preciso encontrar um padrão entre elas para poder desenvolver minha regex
  ou seja, ao visualizar o texto: 

  Maria da Silva - 30/12/1970 --- 30 anoos - mariana.da.silva@hotmail.com
  João Pereira ----- 22/11/1982 - 35 anooos --- joao.pereira@gmail.com
  Mariana Moura --- 07/02/1981 ---- 39 aaanos ---- mariana.moura@uol.com.br

  eu consigo chegar na seguinte analise: O texto começa com um nome, depois é seguido de tracinhos (no mínimo 1 tracinho) e
  logo na sequencia vem datas no formato dd/mm/yyyy e depois vem um ou mais tracinhos seguidos da idade, que é um ou mais
  digitos seguido da palavra anos que está mal escrita. e depois mais tracinhos e depois um email que tem uma arroba.
  
  Com esse pensamento em mente eu consigo desenvolver uma regex por exemplo a regex abaixo:

  (.+) -{1,} (\d{2}\/\d{2}\/\d{4}) -{1,} (\d+) [a]{1,}[n]{1,}[o]{1,}[s]{1,} -{1,} (.+)

  que quer dizer:

  (.+)                            alguma coisa
  -{1,}                           no mínimo 1 traço
  (\d{2}\/\d{2}\/\d{4})           formato da data (2 digitos/2digitos/4digitos)
  -{1,}                           no mínimo 1 traço
  (\d+)                           um ou mais digitos ( representa a idade )
  [a]{1,}[n]{1,}[o]{1,}[s]{1,}    palavra anos que pode estar escrita com 1 ou mais a, 1 ou mais n, 1 ou mais o e 1 ou mais s
  -{1,}                           no mínimo 1 traço
  (.+)                            alguma coisa, neste caso sempre vai ser o email que esta logo após a data


  Exemplo 3 - Validar email:

  Vamos supor que você tem uma ficha de cadastro onde a pessoa entra com um email. 
  Você não pode aceitar emails nitidamente inválidos. Por exemplo, emails não tem espaço, não tem acento.

  Exemplos de emails válidos:
  
  meu@nome.com
  nome.sobrenome50@sub.dominio.com.br

  Exemplo de emails incorretos:

  joao da silva@email.com ( tem espaços)
  joao@da@silva@email.com ( tem varios arrobas )  
  .joao.da.silva@email.com (comeca com ponto) 
  joao@.email.com         ( dominio comeca com ponto )

  Então é possível analisar alguns casos e chegar em um padrão para identificar emails nitidamente incorretos. (do ponto de vista da escrita do email)
  Uma regex que pode verificar isso é 

  $email = "sdodsj\@jdos.com";
  if ( $email =~ m/[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}/gi ) {
    print "yes"
  }

REFERENCES:

http://perldoc.perl.org/perlre.html
