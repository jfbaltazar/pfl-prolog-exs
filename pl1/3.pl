% conhecimento

piloto(lamb).
piloto(besenyei).
piloto(chambliss).
piloto(maclean).
piloto(mangold).
piloto(jones).
piloto(bonhomme).


equipa(lamb, breitling).
equipa(besenyei, red_bull).
equipa(chambliss, red_bull).
equipa(maclean, mediterranean_racing_team).
equipa(mangold, cobra).
equipa(jones, matador).
equipa(bonhomme, matador).


aviao(lamb, mx2).
aviao(besenyei, edge540).
aviao(chambliss, edge540).
aviao(maclean, edge540).
aviao(mangold, edge540).
aviao(jones, edge540).
aviao(bonhomme, edge540).


circuito(istanbul).
circuito(budapest).
circuito(porto).


piloto_venceu(porto, jones).
piloto_venceu(budapest, mangold).
piloto_venceu(istanbul, mangold).


n_gates(istanbul, 9).
n_gates(budapest, 6).
n_gates(porto, 5).


equipa_venceu(C, E) :- piloto_venceu(C, P), equipa(P, E).


% perguntas:

% piloto_venceu(porto, P).
% equipa_venceu(porto, E).
% n_gates(C, _N), _N > 8.
% aviao(P, _A), _A \= edge540.
% piloto_venceu(_C1, P), piloto_venceu(_C2, P), (_C1 \= _C2).
% piloto_venceu(porto, _P), aviao(_P, A).