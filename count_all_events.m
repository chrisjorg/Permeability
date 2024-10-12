clear;
count=zeros(2,1);
events_up=0;
events_down=0;
NN_start=3;
NN_end=22;
M=dlmread('./center_mass_distance_between_each_drug_molecules_and_membrane_800_1000.dat');M=M/10;
data_begin=10;
data_end=length(M);
figure; hold on;
for i=NN_start:NN_end
    plot(M(data_begin:data_end,i),'LineStyle','none','Marker','o','MarkerSize',1.5,'MarkerEdgeColor','blue','MarkerFaceColor','blue');
    title('Z projected coordinate of membrane partitioning')
    xlabel('Time (ns)') % x-axis label
    ylabel('Z-coordinate (nm)') % y-axis label
    xt = get(gca, 'XTick');                                               % 'XTick' Values
    set(gca, 'XTick', xt, 'XTickLabel', xt*4/100,'fontsize',16)             % Relabel 'XTick' With 'XTickLabel' Values

    count=count_flux_number_python(M(data_begin:data_end,i),-2,0.2,2,0.2,0,0.2);   
    events_up=(events_up+count(2,1));
    events_down=(events_down+count(1,1));
end


events=0;
events_up
events_down
events=events_up+events_down

