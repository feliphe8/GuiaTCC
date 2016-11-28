{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}
module Portal where

import Foundation
import Yesod
import Yesod.Static

getPortalR :: Handler Html
getPortalR = defaultLayout $ do
    setTitle "Guia TCC"
    addStylesheetRemote "https://fonts.googleapis.com/icon?family=Material+Icons"
    addStylesheetRemote "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css"
    addStylesheet $ StaticR css_custom_css
    toWidgetHead[hamlet|
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="shortcut icon" href=@{StaticR img_guiatccicone_png}>
    |]
    [whamlet|
    <div id="container">
    
        <nav>
          <div class="nav-wrapper grey lighten-3">
            <a id="logotipo" href=@{HomeR} class="left brand-logo"><img width="220px" class="responsive-img" src=@{StaticR img_guiatcc2_png} alt=""></a>
            <ul id="menu nav-mobile" class="right hide-on-med-and-down">
              <li class="active"><a class="blue-text text-darken-1" href=@{PortalR}><i class="material-icons left">language</i>Portal TCC</a></li>
              <li><a class="red-text text-darken-1" href=@{BibliotecaR}><i class="material-icons left">book</i>Biblioteca TCC</a></li>
              <li><a class="grey-text text-darken-2" href=@{SobreR}><i class="material-icons left">info</i>Sobre</a></li>

        
        
        <section class="content">
          <h3 class="blue-text center d-position-sobre"><i class="medium material-icons">language</i>Portal TCC</h3>
          <div class="container block">
            <p class="paragrafo">
              Nosso Portal é dividido pela seguinte estrutura: FORMATAÇÃO; ESTRUTURA; TEXTO; CITAÇÕES, ILUSTRAÇÕES E REFERÊNCIAS.
              Tudo é dividido de uma maneira que não haverá mais duvidas em relação ao tão temível TCC, tudo detalhado de acordo com os títulos. Explore, tire suas dúvidas e aproveite!!!
          <div class="container block">
            <h4 class="blue-text center"><i class="small material-icons">text_format</i>FORMATAÇÃO</h4>
            <p>
              O Trabalho de Conclusão de Curso deve obedecer à seguinte formatação (de acordo com a estrutura formatada);
            <ul class="collapsible popout" data-collapsible="accordion">
              <li>
                <div class="collapsible-header text-bolder"><i class="material-icons">keyboard_arrow_down</i>FONTE
                <div class="collapsible-body"><p>Arial ou Times New Roman (a fonte escolhida deverá ser a mesma do começo ao fim da monografia) da cor preta para textos (as figuras podem ser coloridas) com tamanho 12 para todo o trabalho, com as seguintes exceções: Fonte menor para citações diretas com mais de três linhas; notas de rodapé; paginação; legendas de tabelas e ilustrações.
              <li>
                <div class="collapsible-header text-bolder"><i class="material-icons">keyboard_arrow_down</i>PAPEL
                <div class="collapsible-body"><p>A4 da cor branca ou papel reciclado
              <li>
                <div class="collapsible-header text-bolder"><i class="material-icons">keyboard_arrow_down</i>MARGEM
                <div class="collapsible-body"><p>Direita e Inferior = 2 cm <br> Esquerda e Superior = 3 cm 
              <li>
                <div class="collapsible-header text-bolder"><i class="material-icons">keyboard_arrow_down</i>DIGITAÇÃO
                <div class="collapsible-body"><p>Digitar na página ímpar: todos os elementos pré-textuais, a primeira folha dos capítulos do trabalho, considerações finais, referências, anexos e apêndices.
              <li>
                <div class="collapsible-header text-bolder"><i class="material-icons">keyboard_arrow_down</i>SEÇÕES
                <div class="collapsible-body"><p>Alinhamento à esquerda, usando: 1 TÍTULO; 1.1 TÍTULO; 1.1.1 Título; 1.1.1.1 Título, 1.1.1.1.1 Título.
              <li>
                <div class="collapsible-header text-bolder"><i class="material-icons">keyboard_arrow_down</i>ESPAÇO ENTRE LINHAS
                <div class="collapsible-body"><p>Simples para os elementos pré e pós-textuais; citações diretas com mais de três linhas; notas de rodapé; legendas de tabelas e ilustrações. 1,5 cm para os elementos textuais.
              <li>
                <div class="collapsible-header text-bolder"><i class="material-icons">keyboard_arrow_down</i>PARÁGRAFOS
                <div class="collapsible-body"><p>Os parágrafos devem estar configurados em 1,25 cm, ou devem estar separados com espaçamento duplo, caso não apresente recuo.
              <li>
                <div class="collapsible-header text-bolder"><i class="material-icons">keyboard_arrow_down</i>PÁGINAS
                <div class="collapsible-body"><p>Canto superior direito, fonte 10, algarismos arábicos. Todas as folhas do TG, a partir da folha de rosto, devem ser contadas, mas não numeradas. A numeração é colocada a partir da primeira folha do elemento textual (Introdução). O TG não tem número mínimo de páginas, mas deve conter todos os elementos obrigatórios.
              <li>
                <div class="collapsible-header text-bolder"><i class="material-icons">keyboard_arrow_down</i>ENCADERNAÇÃO
                <div class="collapsible-body"><p>Para as bancas: 03 exemplares flexíveis (espiral), sendo: 01 para o orientador e 01 para cada elemento da banca. Cor: transparente (frente) e preta (final). Versão final: depósito legal de 01 exemplar na Biblioteca da Instituição, em capa rígida na cor azul escuro e uma cópia em CD.
          <div class="container block">
            <h4 class="blue-text center"><i class="small material-icons">view_compact</i>ESTRUTURA</h4>
            <p>
              A estrutura do TCC compreende os elementos pré-textuais, textuais e pós-textuais, na seguinte ordem de disposição desses elementos;
            <ul class="collapsible popout" data-collapsible="accordion">
              <li>
                <div class="collapsible-header text-bolder"><i class="material-icons">keyboard_arrow_down</i>PRÉ-TEXTUAIS
                <div class="collapsible-body">
                  <p>
                    Capa:<span class="text-bolder">OBRIGATÓRIO</span><br><br>
                    Folha de rosto:<span class="text-bolder">OBRIGATÓRIO</span><br><br>
                    Folha de aprovação:<span class="text-bolder">OBRIGATÓRIO</span><br><br>
                    Dedicatória:OPCIONAL <br><br>
                    Agradecimentos:OPCIONAL <br><br>
                    Epígrafe:OPCIONAL <br><br>
                    Resumo:<span class="text-bolder">OBRIGATÓRIO</span><br><br>
                    Abstract:<span class="text-bolder">OBRIGATÓRIO</span><br><br>
                    Lista de ilustrações:OPCIONAL <br><br>
                    Lista de gráficos:OPCIONAL <br><br>
                    Lista de tabelas:OPCIONAL <br><br>
                    Sumário:<span class="text-bolder">OBRIGATÓRIO</span>
              <li>
                <div class="collapsible-header text-bolder"><i class="material-icons">keyboard_arrow_down</i>TEXTUAIS
                <div class="collapsible-body">
                  <p>
                    Introdução:<span class="text-bolder">OBRIGATÓRIO</span><br><br>
                    Referencial Teórico (Nomear de acordo com o tema e dividir em subcapítulos):<span class="text-bolder">OBRIGATÓRIO</span><br><br>
                    Procedimentos Metodológicos:<span class="text-bolder">OBRIGATÓRIO</span><br><br>
                    Resultados e Discussão:<span class="text-bolder">OBRIGATÓRIO</span><br><br>
                    Considerações Finais:<span class="text-bolder">OBRIGATÓRIO</span>
              <li>
                <div class="collapsible-header text-bolder"><i class="material-icons">keyboard_arrow_down</i>PÓS-TEXTUAIS
                <div class="collapsible-body">
                  <p>
                    Referências (título numerado):<span class="text-bolder">OBRIGATÓRIO</span><br><br>
                    Anexos ou Apêndices (não numerado):OPCIONAL <br><br>
                    Capa final (folha em branco):<span class="text-bolder">OBRIGATÓRIO</span>
          <div class="container block">
            <h4 class="blue-text center"><i class="small material-icons">format_align_left</i>TEXTO</h4>
            <p>
              Nos textos científicos deve-se utilizar a linguagem acadêmica, porém simples e de forma que facilite a leitura e a compreensão do texto, evitando o excesso de erudição e frases rebuscadas. O trabalho científico deve ser claro, objetivo e coerente.
              Jargões, chavões ou expressões coloquiais não podem ser utilizados em textos científicos, a menos que o autor necessite reproduzir a linguagem de um entrevistado ou transcrever uma citação que contenha tais expressões.
            <p>
              É muito importante que seja feita uma cuidadosa revisão textual, preferencialmente por um profissional da área de Letras, de acordo com as novas Regras Ortográficas da Língua Portuguesa, para que o trabalho não seja depreciado e tenha maior credibilidade, clareza e compreensão.
              Deve-se evitar, sempre que possível, o uso de palavras estrangeiras, a menos que sejam termos técnicos consagrados na área. Neste caso, deverão vir transcritos no texto em sua língua original, em itálico.
              Os acrônimos (siglas), em Português ou outros idiomas, deverão apresentar, entre parênteses, o seu significado. Caso sejam muitos, deverão estar reunidos no glossário logo após as referências bibliográficas.
            <ul class="collapsible popout" data-collapsible="accordion">
              <li>
                <div class="collapsible-header text-bolder"><i class="material-icons">keyboard_arrow_down</i>ELEMENTOS PRÉ-TEXTUAIS
                <div class="collapsible-body">
                  <p>
                    <span class="blue-text text-bolder">Dedicatória</span>: o autor presta homenagem ou dedica seu Trabalho de Graduação.<br><br>
                    <span class="blue-text text-bolder">Agradecimentos</span>: o autor faz agradecimentos dirigidos àqueles que contribuíram de maneira relevante à elaboração do trabalho.<br><br>
                    <span class="blue-text text-bolder">Epígrafe</span>: o autor apresenta uma citação, seguida de indicação de autoria, relacionada com a matéria tratada no corpo do trabalho.<br><br>
                    <span class="blue-text text-bolder">Resumo</span>: Apresentação concisa (de 150 a 500 palavras, escrito num parágrafo único) dos pontos relevantes do TG: justificativa, objetivo, procedimentos metodológicos, resultados e considerações finais. Não deve conter citações bibliográficas.<br><br>
                    <span class="blue-text text-bolder">Abstract</span>: O resumo em português deve ser traduzido para o inglês ou espanhol, a critério do aluno. Deve estar localizado após o resumo em português e com a mesma estrutura.<br><br>
                    <span class="blue-text text-bolder">Listas</span>: Listas de Ilustrações, de Tabelas, de Abreviaturas e Siglas, de Símbolos (elementos opcionais). Se utilizados, vêm após o Abstract e devem obedecer a essa ordenação, sempre em folhas distintas.<br><br>
                    Sumário: Enumeração das principais divisões dos elementos textuais do trabalho, na mesma ordem e grafia.
              <li>
                <div class="collapsible-header text-bolder"><i class="material-icons">keyboard_arrow_down</i>ELEMENTOS TEXTUAIS
                <div class="collapsible-body">
                  <p>
                    <span class="blue-text text-bolder">Introdução</span>: Apresenta uma breve narrativa sobre o tema, a justificativa da pesquisa, a problematização, a(s) hipótese(s), o objetivo geral, os objetivos específicos e a divisão do trabalho. Cada capítulo deverá ser brevemente descrito. A introdução não comporta as conclusões do trabalho.<br><br>
                    <span class="blue-text text-bolder">Referencial teórico</span>: Base teórica que fundamenta o trabalho; contextualização do tema. Para tanto, o aluno deverá utilizar-se de citações diretas e indiretas. Poderá envolver dois ou mais capítulos, de acordo com o tema da pesquisa e a critério do orientador. Serão nominados conforme o assunto abordado.<br><br>
                    <span class="blue-text text-bolder">Procedimentos metodológicos</span>: Especificar os procedimentos empregados na realização do estudo.<br><br>
                    <span class="blue-text text-bolder">Resultados e discussão</span>: Descreve os resultados obtidos através da metodologia adotada. Para pesquisa prática, apresentar a discussão e resultados e, para a pesquisa teórica, apenas a discussão.<br><br>
                    <span class="blue-text text-bolder">Considerações finais</span>: Encerra as conclusões dos estudos realizados em, no máximo, duas laudas.<br><br>
                    Observação: fotografias, gráficos, quadros, mapas, tabelas e demais figuras deverão ser colocados entre os parágrafos do texto, logo após a sua citação. Estes elementos serão adicionados em apêndices somente se envolverem a totalidade ou a quase totalidade de uma folha, respeitando-se as devidas margens.
              <li>
                <div class="collapsible-header text-bolder"><i class="material-icons">keyboard_arrow_down</i>ELEMENTOS PÓS-TEXTUAIS
                <div class="collapsible-body">
                  <p>
                    <span class="blue-text text-bolder">Referências</span>: Apresentam a bibliografia e demais recursos citados no corpo do TG. Deverá estar organizada em ordem alfabética, com alinhamento à esquerda e de acordo com as normas.<br><br>
                    <span class="blue-text text-bolder">Apêndices</span>: Apêndices são os materiais elaborados pelo autor (modelos de entrevistas, formulários, etc.). Glossário/ Apêndice(s) / Anexo(s) / Índice(s) (elementos opcionais). Se utilizados, devem obedecer a essa ordenação, sempre em folhas distintas.<br><br>
                    <span class="blue-text text-bolder">Anexos</span>: apresentam os complementos não elaborados pelo autor (legislação, mapas, etc.).<br><br>
                    Observação: Após a finalização da pesquisa de campo, o aluno deverá apresentar a totalidade dos questionários preenchidos ao seu orientador. Estes mesmos questionários deverão estar disponíveis no dia da Defesa do TG, caso algum membro da banca os solicite.<br><br>
          <div class="block container">
            <h4 class="blue-text center"><i class="small material-icons">more</i>CITAÇÕES, ILUSTRAÇÕES E REFERÊNCIAS</h4>
            <p>
              Apresentamos, a seguir, algumas dicas e orientações, de acordo com as normas
              da ABNT, que abordam as formas e conteúdos para fazer citações e referências em
              trabalhos acadêmicos.
            <h5 class="blue-text">CITAÇÕES DIRETAS</h5>
            <p>
              É a transcrição literal (cópia exata) de parte da obra do autor consultado. Deve-
              se sempre fazer um diálogo com o autor mencionado, ou seja, deve haver um
              comentário, uma análise, uma explicação por parte do aluno.
              A apresentação é de duas formas, com até 03 linhas e com mais de 03 linhas.
            <h5 class="blue-text">Citação direta com até 03 linhas</h5>
            <p>
              É transcrita entre aspas, com o mesmo tipo e tamanho de letra utilizada no
              parágrafo onde está inserida. Devem ser identificada fonte, ano e página, com o nome
              do autor dentro (maiúscula) ou fora dos parênteses.
              Exemplos:
            <div class="square">
              Para Koch (2004, p. 143-144), a intertextualidade ocorre quando, “em um texto,
              está inserido outro texto (intertexto) anteriormente produzido”, fazendo parte da
              memória social coletiva ou discursiva.
            <div class="square">
              Fazendo parte da memória social coletiva ou discursiva, a intertextualidade
              ocorre quando, “em um texto, está inserido outro texto (intertexto) anteriormente
              produzido.” (KOCH, 2004, p. 143-144)
            <h5 class="blue-text">Citação direta com mais de 3 linhas</h5>
            <p>
              Essa citação inicia-se no recuo de 4 centímetros, sem deslocamento para a primeira
              linha, e termina na margem direita. O texto citado deve ter espaço simples entre as
              linhas e letra de tamanho menor que 12. Deve ser identificada a fonte, ano e página.
            <h5 class="blue-text">CITAÇÕES INDIRETAS</h5>
            <p>
              Na citação indireta, as ideias não são do pesquisador, mas do autor consultado
              como fonte de pesquisa relevante ao trabalho. Deve-se mencionar o nome do autor e o
              ano de publicação do trabalho, mas o número da página não é obrigatório. Exemplos:
            <div class="square">
              A leitura, segundo Koch e Elias (2006) pode ser considerada como uma atividade de
              produção de sentidos, na qual o leitor utiliza-se das estratégias de seleção, de
              antecipação e de hipóteses (autor, meio de veiculação, gênero, título, configuração),
              inferência e verificação.
            <div class="square">
              A leitura pode ser considerada como uma atividade de produção de sentidos, na qual o
              leitor utiliza-se das estratégias de seleção, de antecipação e de hipóteses (autor, meio
              de veiculação, gênero, título, configuração), inferência e verificação. (KOCH; ELIAS,
              2006)
            <p>
              E para o texto com citações ficar esteticamente apresentável sugere-se os
              termos que seguem:
            <ul class="list">
              <li>Apropriadamente, Lima (2000) coloca que...
              <li>Em consonância com isso, Ribeiro (2000) ...
              <li>Souza (2009) expressa que... / revela que...
              <li>Concordo com Rezende (2010) quando analisa ... / Conforme Rezende...
              <li>No entendimento de Teixeira (2005)... / Como diz Teixeira... / Na concepção de Teixeira...
              <li>Ainda referenciando o mesmo autor...
              <li>A respeito desse assunto... / Em relação a isto... / Em relação ao exposto...
              <li>Convém observar que... / Valendo-me dos estudos de...
              <li>Candido (2007) considera.../ argumenta.../ refere.../ afirma.../ discute os resultados...
              <li>Silva (2000) aborda.../ destaca.../ salienta.../ conclui.../ comenta.../ contempla...
              <li>Os dados do IBGE (2000) revelam que...
              <li>A teoria de Ortiz apud Silva (2000) traz que........; já a teoria de Horta (1999) contempla...
              <li>....que vai ao encontro do Artigo 227 da Constituição Brasileira de 1988.
            <p>
              Algumas observações:
              <br><br>
              1. Usa-se o termo APUD quando as ideias do 1º autor são mencionadas no
              material publicado pelo 2º autor, mas só se deve utilizar esse tipo de citação quando
              não houver acesso à fonte de pesquisa.
              <br><br>
              2. As supressões de partes de frases de uma citação são expressas por [...].
              <br><br>
              3. Id.= idem (do mesmo autor). Pode substituir o nome do autor em notas
              sucessivas na mesma página.
            <h5 class="blue-text">ILUSTRAÇÕES</h5>
            <p>
              Nas ilustrações (desenho, esquema, fluxograma, fotografia, gráfico, mapa,
              planta, gráfico, imagem, etc.), digitar a identificação na parte superior, com o número de
              ordem e título e, na parte inferior, indicar a fonte consultada mesmo que seja produção
              do próprio autor. As referências digitais (Disponível em: <...>. Acesso em: ...) devem
              constar apenas nas referências finais do trabalho.
            <h5 class="blue-text">NORMAS PARA REFERÊNCIAS</h5>
            <p>
              As referências são todas as fontes de pesquisa consultadas para a elaboração
              do trabalho acadêmico. As referências devem vir no final do trabalho, em ordem
              alfabética pelo sobrenome do autor.
              Os elementos essenciais são: autor(es), título, edição, local, editora e data de
              publicação. E os elementos gráficos são: alinhamento à esquerda; linhas com espaço
              simples na referência e espaço duplo entre referências; e usar título em negrito (só
              quando houver autoria) e sem destaque no subtítulo.
              Com base na Associação Brasileira de Normas Técnicas – NBR6023/02
              apresentamos alguns exemplos mais comuns:
              <br><br>
              1) Livro com um autor:
              ALVES, Roque de Brito. Ciência criminal. Rio de Janeiro: Forense, 1995.
              <br><br>
              2) Livro com dois autores:
              DAMIÃO, Regina Toledo; HENRIQUES, Antonio. Curso de direito jurídico. São Paulo:
              Atlas, 1995.
              <br><br>
              3) Livro com mais de três autores (et al.):
              URANI, A. et al. Constituição de uma matriz de contabilidade social para o Brasil.
              Brasília, DF: IPEA, 1994.
              <br><br>
              4) Autor com mais de uma obra:
              FREYRE, Gilberto. Casa grande &amp; senzala: formação da família brasileira sob regime
              de economia patriarcal. Rio de Janeiro: J.Olympio, 1943. 2 v.
              ______. Sobrados e mucambos: decadência do patriarcado rural no Brasil. São
              Paulo: Ed. Nacional, 1936.
              <br><br>
              5) Autor Entidade Coletiva (Associações, Empresas, Instituições):
              UNIVERSIDADE DE SÃO PAULO. Instituto Astronômico e Geográfico. Anuário
              astronômico. São Paulo, 1988. 279 p.
              <br><br>
              6) Dissertação ou tese:
              PORTELLA, Marilene Rodrigues. Cuidar/Educar para um envelhecimento saudável:
              a construção de um processo educativo com mulheres de uma comunidade rural de
              <br><br>
              Passo Fundo/RS. 1998. 123 f. Dissertação (Mestrado em Assistência de Enfermagem)
              - Curso de Pós-Graduação em Enfermagem, Universidade Federal de Santa Catarina.
              <br><br>
              7) Periódico:
              BOLETIM GEOGRÁFICO. Rio de Janeiro: IBGE, 1943-1978.Trimestral.
              <br><br>
              8) Artigo e/ou matéria de revista, boletim etc.
              GURGEL, C. Reforma do Estado e segurança pública. Política e Administração, Rio
              de Janeiro, v. 3, n. 2, p. 15-21, set. 1997.
              <br><br>
              9) Evento
              IUFOST INTERNATIONAL SYMPOSIUM ON CHEMICAL CHANGES DURING FOOD
              PROCESSING, 1984, Valencia. Proceedings...Valencia: Instituto de Agroquímica y
              Tecnología de Alimentos, 1984.
              <br><br>
              10) Trabalho apresentado em evento
              BRAYNER, A. R. A.; MEDEIROS, C. B. Incorporação do tempo em SGBD orientado a
              objetos. In: SIMPÓSIO BRASILEIRO DE BANCO DE DADOS, 9., 1994, São Paulo.
              Anais... São Paulo: USP, 1994. p. 16-29.
              <br><br>
              11) Legislação
              BRASIL. Código civil. 46. ed. São Paulo: Saraiva, 1995.
              <br><br>
              12) Autor entidade:
              ASSOCIAÇÃO BRASILEIRA DE NORMAS TÉCNICAS. NBR 10520: informação e
              documentação: citações em documentos: apresentação. Rio de Janeiro, 2002.
              <br><br>
              13) Artigo e/ou matéria de revista, boletim etc. em meio eletrônico
              SILVA, M. M. L. Crimes da era digital. .Net, Rio de Janeiro, nov. 1998. Seção Ponto de
              Vista. Disponível em: <http://www.brazilnet.com.br/contexts/brasilrevistas.htm>;. Acesso
              em: 28 nov. 1998.
              <br><br>
              14) Artigo e/ou matéria de jornal NAVES, P. Lagos andinos dão banho de beleza. Folha de S. Paulo, São Paulo, 28 jun.
              1999. Folha Turismo, Caderno 8, p. 13.
              <br><br>
              15) Séries e coleções
              CARVALHO, Marlene. Guia prático do alfabetizador. São Paulo: Ática, 1994. 95 p.
              (Princípios, 243).

        
        
        <footer class="page-footer grey lighten-3">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <img src=@{StaticR img_guiatcc2_png} width="200px">

              <div class="col l4 offset-l2 s12">
                <ul>
                  <li><a class="grey-text text-darken-2" href=@{HomeR}>Página Inicial</a></li>
                  <li><a class="grey-text text-darken-2" href=@{PortalR}>Portal TCC</a></li>
                  <li><a class="grey-text text-darken-2" href=@{BibliotecaR}>Biblioteca TCC</a></li>
                  <li><a class="grey-text text-darken-2" href=@{SobreR}>Sobre</a></li>

          <div class="footer-copyright grey-text text-darken-2">
            <div class="container">
              <p>© 2016 Copyright <a href=@{LoginUsuarioR}>Painel Admin</a></p>

    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
    <script type="text/javascript" src=@{StaticR js_custom_js}></script>

    |]

    