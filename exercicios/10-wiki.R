# 1. Crie uma função wiki_baixar_pag() que baixa uma página dado um URL. Use o
# URL para criar um nome único para o arquivo a ser salvo.

# 2. Crie uma função wiki_primeiro_link() que recebe um caminho de arquivo da
# Wikipédia e retorna o primeiro link que aparece no corpo do artigo.

# 3. Crie uma função wiki_ate_filo() que recebe o link para uma página da
# Wikipédia e repete o processo wiki_primeiro_link() -> wiki_baixar_pag() até
# encontrar a página https://en.wikipedia.org/wiki/Philosophy (ou até passar
# por 20 páginas, o que ocorrer antes). Ela deve retornar o número de passos
# até encontrar o artigo sobre filosofia.

# 4. Crie uma função wiki_jogo() que recebe um vetor de links da Wikipédia em
# inglês e executa wiki_ate_filo() para cada um, preferencialmente em paralelo.
# Ela deve retornar a média da distância entre cada artigo e filosofia.
