function[] = RING1(n,l,look)


if nargin==0
    n = 8;  %pocet castic
    l = 60; %dlzka kruhu
    look = 1; %ako daleko sa pred seba pozerat
end



clear D P
[A,D,N,T] = MATICE(n); %funkction MATICE

t = [0 diff(T)];
j = 0;


for k = A
    j = j + 1;
    
    
    %============ZISTIM POCET VOLNYCH MIEST==============
    if N(k)==max(N)
       d = l - max(N) + min(N) -1;
    else
       h = N>N(k);
       d = min(N(h)) - N(k) -1;
    end 
       
   
        
    %====================MOZNOSTI POHYBU===================    
    if N(k)==l 
        if rand<=(d/look)^2
                N(k) = 1;   %pohyb na zaciatok
        end
        
    else    
        if rand<=(d/look)^2  
                N(k) = N(k)+1;  %pohyb dopredu
        end
    end
      D(j) = d;
      
      
    %===================VYKRESLENIE==========================  
    %figure(2)
    %plot (N, 0, 'o','LineWidth',2)
    %axis([0 l -1 1])
 
    
    %wait(t/15)
        
end



    %===============Pravdepodobnost==================

    D = D(500:3000); % orezanie informacii o d


    P = arrayfun(@(x)length(find(D==x)), unique(D)) / length(D); %vypocet pravdepodobnosti elemtov D

    figure(3)
    bar(P)
    title('Distance Probability')
    xlabel('{\it d}')
    ylabel('probability')

   % dfittool(D)
end