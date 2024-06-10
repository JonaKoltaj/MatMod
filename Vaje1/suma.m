function pari = suma(a,s)
    k = 1;
    n = length(a);
    st = 0;
    pari = zeros(2,n);
    while k<n
        if a(k)+a(n)==s
            ponovitve = 1;
            for i = n-1:-1:k+1
                if a(i)==a(n)
                    ponovitve= ponovitve + 1;
                else
                    break
                end
            end
        pari(:,st+1:st+ponovitve) = repmat([a(k);a(n)],1,ponovitve);
        st = st + ponovitve;
        k = k + 1;
        elseif a(k)+a(n)<s
            k = k + 1;
        else
            n = n - 1;
        end
    end
    pari = pari(:,1:st);




         


            
