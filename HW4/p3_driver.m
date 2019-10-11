%% Problem 3

%% Probelm 3(a)

L1 = ptb_eig(20, 1, 4, 0)
L2 = ptb_eig(20, 1, 4, 0.1)

%% Problem 3(b)
% n = 5 or 20
s = 0.1
n = 5

B = zeros(n);
B(1,1) = -1;
B(2, n) = 1;

A = mctr(n, 1, 4);
[R, Lam] = eig(A1);
L = R^(-1);

Er = zeros(n,1000)

for i = 1:1000
    s1 = s/i;
    L_s1 = ptb_eig(n, 1, 4, s1);
    
    for k = 1:n
        dlambd = L(k,:) * B1 * R(: , k) / (L(k,:) * R(: , k));
        lambd_new = L_s1(k);
        del_lambd = lambd_new - Lam(k,k);
        Er(k,i) = norm(del_lambd1 - s1 * dlambd , 2);
    end
end


for k = 1:n
    plot(Er(k,:))
    hold on
end
title('$\log(E_2(0.1/k))$, for $n = 20$, $1 \le k \le 1000$' , 'Interpreter','latex')
xlabel('k')

