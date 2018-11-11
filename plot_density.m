function plot_density(L,T,Delta_x,Delta_t,rho)


figure
[X,Y]=meshgrid(0:Delta_t:T,Delta_x/2:Delta_x:L-Delta_x/2);
surf(X,Y,rho','EdgeColor','none');
view(2)
axis tight
colormap(jet)
c = colorbar('Limits',[0 max(max(rho))]) ;
c.Label.String = 'Density (veh/km)'; % OPTIONNAL
xlabel('Time (hr)','Fontsize',14)
ylabel('Space (km)','Fontsize',14)