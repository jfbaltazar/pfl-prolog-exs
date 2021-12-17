% sou anti-trabalho e anti-corporativismo mas aqui estamos. continuai a votar ps...

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


% reciclando o 5 c),

chefe(X, Y) :- cargo(Cx, X), cargo(Cy, Y), chefiado_por(Cx, Cy).


superior(X, Y) :- chefe(Y, X).
superior(X, Y) :- chefe(Y, Z), superior(X, Z).