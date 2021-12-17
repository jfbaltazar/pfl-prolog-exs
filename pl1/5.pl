% conhecimento

cargo(tecnico, eleuterio).
cargo(tecnico, juvenaldo).
cargo(analista, leonilde).
cargo(analista, marciliano).
cargo(engenheiro, osvaldo).
cargo(engenheiro, porfirio).
cargo(engenheiro, reginaldo).
cargo(supervisor, sisnando).
cargo(supervisor_chefe, gertrudes).
cargo(secretaria_exec, felismina).
cargo(diretor, asdrubal).
chefiado_por(tecnico, engenheiro).
chefiado_por(engenheiro, supervisor).
chefiado_por(analista, supervisor).
chefiado_por(supervisor, supervisor_chefe).
chefiado_por(supervisor_chefe, diretor).
chefiado_por(secretaria_exec, diretor).


% a)
% i. O Sisnando chefia analistas? Se sim, qual o seu cargo?
% ii. O cargo de tecnico e chefiado por que cargo? E a que entidade responde o seu superior?
% iii. Quem e chefiado pelo supervisor e qual o seu cargo?
% iv. Qual e o cargo dos chefiados pelo diretor excetuado a felismina?

% b)
% i. X=supervisor
% ii. X=engenheiro, Y=supervisor
% iii. J=analista, P=leonilde
% iv. P=supervisor_chefe

% c)
chefe(X, Y) :- cargo(Cx, X), cargo(Cy, Y), chefiado_por(Cx, Cy).
responsavel_por(X, Y) :- chefiado_por(Y, X).