%% NAO TENHO A CERTEZA SOBRE ESTE EXERCICIO

immature(X):- adult(X), !, fail.
% cut vermelho - impede immature(X). de correr, cortando para adultos e nao-adultos
immature(X).
adult(X):- person(X), !, age(X, N), N >=18.
adult(X):- turtle(X), !, age(X, N), N >=50.
adult(X):- spider(X), !, age(X, N), N>=1.
adult(X):- bat(X), !, age(X, N), N >=5.
% cuts verdes - ASSUMINDO que person/1, turtle/1, spider/1 e bat/1 sao mutuamente exclusivos
