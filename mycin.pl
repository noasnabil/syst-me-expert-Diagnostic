# Syst-me-expert-Diagnostic
#ce projet vise à proposer un Système Expert ecrit en Prolog pour le Diagnostic de certaines maladies 
#Pour lancer le projet utiliser "diagnostic."
#Une série de question vous eront poser afin de détecter la maladie à travaers un ensemble de Symptômes.
:-encoding(utf8).

% Exemple d'utilisation
diagnostics :-
    diagnostic(Maladie),
    write('Vous etes diagnostique avec: '), write(Maladie),nl,
	traitement(Maladie),
	write('Vous devez consulter votre medecin').

% Règles pour diagnostiquer la maladie en fonction des symptômes
diagnostic(grippe) :-
    verify(fievre),
	verify(toux),
    verify(maux_de_tete),
	verify(fatigue),
    verify(douleur_musculaire),!.
	
diagnostic(bronchiolite_virale) :-
    verify(fievre),
	verify(toux),
	verify(age_moins_2ans),
	verify(fatigue),
	verify(nez_qui_coule ), 
	verify(mal_de_gorge),
	verify(difficulte_a_respirer),
	verify(sifflement),!.
	
diagnostic(pneumonie) :-
    verify(fievre),
    verify(respiration_rapide),
    verify(toux).
	
diagnostic(lepre) :-
	verify(prurit),
	verify(absence_de_sueur),
	verify(insensibilite),!.	
	
diagnostic(intoxication_alimentaire) :-
    verify(fievre),
    verify(frissons),
	verify(douleurs_abdominales),
    verify(diarees),
	verify(vomissement),!.

diagnostic(appendicite) :-
    verify(fievre),
	verify(douleurs),
    verify(constipation),
	verify(nausees),!.

diagnostic(migraine) :-
    verify(maux_de_tete),
    verify(sensibilite_lumiere),
    verify(nausees),!.

diagnostic(rougeole) :-
    verify(fievre),
    verify(eruption_cutanee),
    verify(yeux_rouges_larmoyants),!.


diagnostic(varicelle) :-
    verify(fatigue),
    verify(douleurs_articulairs),
    verify(vesicules_molles_sur_le_corps),!.

diagnostic(rubeole) :-
    verify(lesions_visage),
    verify(lesion_membre),
	verify(lesion_tronc),
    verify(fievre_moderee),!.



% Fonction de pose de question au patient (à adapter selon l'interface utilisateur)
ask(Question) :-
        write('Est ce que vous avez  :  '),
        write(Question), write('? (yes/no)  '),
        read(Response), nl,
         ( (Response == yes ; Response == y)
         -> assert(yes(Question)) ;
         assert(no(Question)), fail).
		 
:- dynamic yes/1,no/1.

verify(S) :- (yes(S) -> true ; (no(S) -> fail ; ask(S))).


/* undo all yes no assertions */
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
traitement(grippe):-
    write('Ce qui est conseillé : '),nl,
    write('la prise d antipyrétiques en cas de fièvre.'),nl,
	write('la prise du paracétamol est privilégié.'), nl,
	write('En cas de contre-indication, prise d anti-inflammatoires non stéroïdiens (ibuprofène) ou aspirine.'),nl, 
	write('Utiliser de préférence un seul type de médicament.'), nl.
traitement(bronchiolite_virale):-
    write('Ce qui est conseillé : '),nl,
    write('Chez l enfant hospitalisé, une oxygénothérapie à 30 à 40% d oxygène apportés par canule nasale'),nl,
	write('Maintenir la saturation en oxygène > 90%.'),nl,
	write('L intubation endotrachéale.').
	
