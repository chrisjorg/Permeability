function y=count_flux_number_python(MM,z_down,H_down,z_up,H_up,z_mid,H_mid)
event_count=zeros(2,1);
condition=zeros(3,2);
for i=1:length(MM)
 if abs(MM(i)-z_down)<H_down
     condition(1,1)=1;
 end
     if (condition(1,1)==1)&& (MM(i)<(z_down-H_down))
         condition(1,1)=0;condition(2,1)=0;
     end
 if ((abs(MM(i)-z_mid)<H_mid)&&(condition(1,1)==1))
     condition(2,1)=1;
 end
 if ((abs(MM(i)-z_up)<H_up)&&(condition(2,1)==1))
     condition(3,1)=1;
 end
 
 if abs(MM(i)-z_up)<H_up
     condition(1,2)=1;
 end
     if (condition(1,2)==1)&& (MM(i)>(z_up+H_up))
         condition(1,2)=0;
         condition(2,2)=0;
     end
 if ((abs(MM(i)-z_mid)<H_mid)&&(condition(1,2)==1))
     condition(2,2)=1;
 end
 if ((abs(MM(i)-z_down)<H_down)&&(condition(2,2)==1))
     condition(3,2)=1;
 end
 
 
 
 
  if condition(3,1)==1
      event_count(1,1)=(event_count(1,1)+1);
      for j=1:3
          condition(j,1)=0;
      end
  end
  
  if condition(3,2)==1
      event_count(2,1)=(event_count(2,1)+1);
      for j=1:3
          condition(j,2)=0;
      end
  end
     
end    
y=event_count;
