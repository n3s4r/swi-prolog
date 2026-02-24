% -------------------
% NSU CGPA Calculator
% -------------------

% grade_point(Score, GP)
% Maps numerical score (0–100) to NSU grade points.

grade_point(S, 4.0) :- S >= 93, !.
grade_point(S, 3.7) :- S >= 90, S < 93, !.
grade_point(S, 3.3) :- S >= 87, S < 90, !.
grade_point(S, 3.0) :- S >= 83, S < 87, !.
grade_point(S, 2.7) :- S >= 80, S < 83, !.
grade_point(S, 2.3) :- S >= 77, S < 80, !.
grade_point(S, 2.0) :- S >= 73, S < 77, !.
grade_point(S, 1.7) :- S >= 70, S < 73, !.
grade_point(S, 1.3) :- S >= 67, S < 70, !.
grade_point(S, 1.0) :- S >= 60, S < 67, !.
grade_point(_, 0.0).  % F or anything below 60 or uncounted

% compute_quality(Courses, TotalCredits, SumQuality)
% Courses = list of (Score-Credits) pairs.

compute_quality([], 0, 0).
compute_quality([Score-Cr | T], TotCr, TotQ) :-
    compute_quality(T, CrRest, QRest),
    grade_point(Score, GP),
    Q is GP * Cr,
    TotCr is Cr + CrRest,
    TotQ is Q + QRest.

% cgpa(Courses, CGPA)
cgpa(Courses, CGPA) :-
    compute_quality(Courses, TotCr, TotQ),
    (TotCr > 0 ->
        CGPA is TotQ / TotCr
    ;
        CGPA = 0.0
    ).

% print_cgpa(Courses)
print_cgpa(Courses) :-
    cgpa(Courses, CG),
    format('Your CGPA is: ~2f~n', [CG]).

% Example usage:
% ?- print_cgpa([95-3, 88-3, 72-4, 81-1]).
% Output: Your CGPA is: 3.31
