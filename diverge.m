function Q = diverge(geometry,A,rho_0)

% I. Initialization
Demand_1 = geometry(1).Demand;
Supply_2 = geometry(2).Supply;
Supply_3 = geometry(3).Supply;

% ------------------ Optional ------------------
% (only if one wants to compute the densities and not the flows)
% rho = NaN(size(rho_0));
% flow_1 = geometry(1).flow_function;
% flow_2 = geometry(2).flow_function;
% flow_3 = geometry(3).flow_function;
% rho_max_1 = geometry(1).rho_max;
% rho_max_2 = geometry(2).rho_max;
% rho_max_3 = geometry(3).rho_max;
% ----------------------------------------------

% Demand on the incoming road
D1 = Demand_1(rho_0(1));
% Supply on the first outgoing road
S2 = Supply_2(rho_0(2));
% Supply on the second outgoing road
S3 = Supply_3(rho_0(3));

q1 = min( D1, min(S2/A, S3/(1-A)) ) ;
q2 = A*q1 ;
q3 = (1-A)*q1;

Q = [q1 q2 q3];

% ------------------ Optional ------------------
% if q1 == D1
%     % Free-flow densities
%     [rho(1),~] = density_from_flow(flow_1,rho_max_1,q1);
%     [rho(2),~] = density_from_flow(flow_2,rho_max_2,q2);
%     [rho(3),~] = density_from_flow(flow_3,rho_max_3,q3);
% else
% % Congested densities
%     [~,rho(1)] = density_from_flow(flow_1,rho_max_1,q1);
%     [~,rho(2)] = density_from_flow(flow_2,rho_max_2,q2);
%     [~,rho(3)] = density_from_flow(flow_3,rho_max_3,q3);
% end
% ----------------------------------------------