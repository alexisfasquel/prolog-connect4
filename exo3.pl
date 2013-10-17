element(1,X,[X|_]).
element(I,X,[_|Q]):- (integer(I), I1 is I-1, element(I1,X,Q)), ! ;(element(I1,X,Q), I is I1+1).
