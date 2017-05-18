

Table_1 = dlmread('Table_AB_new_1.txt'); % get raw data of all subjects
Table_2 = dlmread('Table_AB_new_2.txt'); % get raw data of all subjects
Table_3 = dlmread('Table_AB_new_3.txt'); % get raw data of all subjects
Table_4 = dlmread('Table_AB_new_4.txt'); % get raw data of all subjects
Table_5 = dlmread('Table_AB_new_5.txt'); % get raw data of all subjects
Table_human=[Table_1; Table_2;Table_3;Table_4;Table_5];
%%
RT_1=[];
reward_1=[];
RT_2=[];
reward_2=[];
RT_3=[];
reward_3=[];
RT_4=[];
reward_4=[];
RT_5=[];
reward_5=[];
RT_6=[];
reward_6=[];
RT_7=[];
reward_7=[];
RT_8=[];
reward_8=[];
RT_9=[];
reward_9=[];
RT_10=[];
reward_10=[];

num_1=[];
num_2=[];
num_3=[];
num_4=[];
num_5=[];
num_6=[];
num_7=[];
num_8=[];
num_9=[];
num_10=[];
          

for i=1:length(Table_human)
    if Table_human(i,1)==21001
        RT_1=[RT_1, Table_human(i,4)];
        RT_all_1=transpose(RT_1);
        reward_1=[reward_1,Table_human(i,6)];
        reward_all_1=transpose(reward_1);
        sum_reward_1=sum(reward_all_1);
        num_1=[num_1,Table_human(i,1)];
        num_1_all=numel(num_1);
    else if Table_human(i,1)==22002
        RT_2=[RT_2, Table_human(i,4)];
        RT_all_2=transpose(RT_2);
        reward_2=[reward_2,Table_human(i,6)];
        reward_all_2=transpose(reward_2);
        sum_reward_2=sum(reward_all_2);
        num_2=[num_2,Table_human(i,7)];
          num_2_all=numel(num_2);
        else if Table_human(i,1)==21003
        RT_3=[RT_3, Table_human(i,4)];
        RT_all_3=transpose(RT_3);
        reward_3=[reward_3,Table_human(i,6)];
        reward_all_3=transpose(reward_3);
        sum_reward_3=sum(reward_all_3);
        num_3=[num_3,Table_human(i,7)]; 
          num_3_all=numel(num_3);
            else if Table_human(i,1)==22004
        RT_4=[RT_4, Table_human(i,4)];
        RT_all_4=transpose(RT_4);
        reward_4=[reward_4,Table_human(i,6)];
        reward_all_4=transpose(reward_4);
        sum_reward_4=sum(reward_all_4);
        num_4=[num_4,Table_human(i,7)];
          num_4_all=numel(num_4);
                else if Table_human(i,1)==21005
        RT_5=[RT_5, Table_human(i,4)];
        RT_all_5=transpose(RT_5);
        reward_5=[reward_5,Table_human(i,6)];
        reward_all_5=transpose(reward_5);
        sum_reward_5=sum(reward_all_5);
        num_5=[num_5,Table_human(i,7)]; 
          num_5_all=numel(num_5);
                    else if Table_human(i,1)==12006
        RT_6=[RT_6, Table_human(i,4)];
        RT_all_6=transpose(RT_6);
        reward_6=[reward_6,Table_human(i,6)];
        reward_all_6=transpose(reward_6);
        sum_reward_6=sum(reward_all_6);
        num_6=[num_6,Table_human(i,7)];
          num_6_all=numel(num_6);
                        else if Table_human(i,1)==21007
        RT_7=[RT_7, Table_human(i,4)];
        RT_all_7=transpose(RT_7);
        reward_7=[reward_7,Table_human(i,6)];
        reward_all_7=transpose(reward_7);
        sum_reward_7=sum(reward_all_7);
        num_7=[num_7,Table_human(i,7)]; 
          num_7_all=numel(num_7);
                            else if Table_human(i,1)==12008
        RT_8=[RT_8, Table_human(i,4)];
        RT_all_8=transpose(RT_8);
        reward_8=[reward_8,Table_human(i,6)];
        reward_all_8=transpose(reward_8);
        sum_reward_8=sum(reward_all_8);
        num_8=[num_8,Table_human(i,7)]; 
          num_8_all=numel(num_8);
                                else if Table_human(i,1)==21009
        RT_9=[RT_9, Table_human(i,4)];
        RT_all_9=transpose(RT_9);
        reward_9=[reward_9,Table_human(i,6)];
        reward_all_9=transpose(reward_9);
        sum_reward_9=sum(reward_all_9);
        num_9=[num_9,Table_human(i,7)]; 
          num_9_all=numel(num_9);
                                    else if Table_human(i,1)==12010
        RT_10=[RT_10, Table_human(i,4)];
        RT_all_10=transpose(RT_10);
        reward_10=[reward_10,Table_human(i,6)];
        reward_all_10=transpose(reward_10);
        sum_reward_10=sum(reward_all_10);
        num_10=[num_10,Table_human(i,7)]; 
          num_10_all=numel(num_10);
    else
        disp('no value')
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

%%
preferred_1=[];
preferred_2=[];
preferred_3=[];
preferred_4=[];
preferred_5=[];
preferred_6=[];
preferred_7=[];
preferred_8=[];
preferred_9=[];
preferred_10=[];


for u=1:length(Table_human)
    if (Table_human(u,1)==21001) & (Table_human(u,7)==1);
        preferred_1=[preferred_1,Table_human(u,1)];
        num_preferred_1=numel(preferred_1);
    else if (Table_human(u,1)==22002)& (Table_human(u,7)==1);
          preferred_2=[preferred_2,Table_human(u,7)];
          num_preferred_2=numel(preferred_2);
        else if (Table_human(u,1)==21003)& (Table_human(u,7)==1);
          preferred_3=[preferred_3,Table_human(u,7)]; 
          num_preferred_3=numel(preferred_3);
            else if (Table_human(u,1)==22004)& (Table_human(u,7)==1);
          preferred_4=[preferred_4,Table_human(u,7)];
          num_preferred_4=numel(preferred_4);
                else if (Table_human(u,1)==21005)& (Table_human(u,7)==1);
          preferred_5=[preferred_5,Table_human(u,7)]; 
          num_preferred_5=numel(preferred_5);
                    else if (Table_human(u,1)==12006)& (Table_human(u,7)==1);
          preferred_6=[preferred_6,Table_human(u,7)];
          num_preferred_6=numel(preferred_6);
                        else if (Table_human(u,1)==21007)& (Table_human(u,7)==1);
          preferred_7=[preferred_7,Table_human(u,7)]; 
          num_preferred_7=numel(preferred_7);
                            else if (Table_human(u,1)==12008)& (Table_human(u,7)==1);
          preferred_8=[preferred_8,Table_human(u,7)]; 
          num_preferred_8=numel(preferred_8);
                                else if (Table_human(u,1)==21009)& (Table_human(u,7)==1);
          preferred_9=[preferred_9,Table_human(u,7)]; 
          num_preferred_9=numel(preferred_9);
                                    else if (Table_human(u,1)==12010)& (Table_human(u,7)==1);
          preferred_10=[preferred_10,Table_human(u,7)]; 
          num_preferred_10=numel(preferred_10);
        else
            disp('no value')
        end
    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

proportion_chosen_preferred_1=num_preferred_1/num_1_all;
proportion_chosen_preferred_2=num_preferred_2/num_2_all;
proportion_chosen_preferred_3=num_preferred_3/num_3_all;
proportion_chosen_preferred_4=num_preferred_4/num_4_all;
proportion_chosen_preferred_5=num_preferred_5/num_5_all;
proportion_chosen_preferred_6=num_preferred_6/num_6_all;
proportion_chosen_preferred_7=num_preferred_7/num_7_all;
proportion_chosen_preferred_8=num_preferred_8/num_8_all;
proportion_chosen_preferred_9=num_preferred_9/num_9_all;
proportion_chosen_preferred_10=num_preferred_10/num_10_all;

proportion_chosen_all=[proportion_chosen_preferred_1,proportion_chosen_preferred_2;...
    proportion_chosen_preferred_3,proportion_chosen_preferred_4;...
    proportion_chosen_preferred_5,proportion_chosen_preferred_6;...
    proportion_chosen_preferred_7,proportion_chosen_preferred_8;...
    proportion_chosen_preferred_9,proportion_chosen_preferred_10]
%
proportion_chosen_all_new=[proportion_chosen_preferred_1,proportion_chosen_preferred_2,...
    proportion_chosen_preferred_3,proportion_chosen_preferred_4,...
    proportion_chosen_preferred_5,proportion_chosen_preferred_6,...
    proportion_chosen_preferred_7,proportion_chosen_preferred_8,...
    proportion_chosen_preferred_9,proportion_chosen_preferred_10]

%
sum_all=[sum_reward_1,sum_reward_2,...
    sum_reward_3,sum_reward_4,...
    sum_reward_5,sum_reward_6,sum_reward_7,sum_reward_8,sum_reward_9,...
    sum_reward_10];
%
 %
figure('Name','proportion of chosen preferred')
bar(proportion_chosen_all)
title('% of chosen preferred target for pairs');
ylabel('% of chosen preferred')
legend('subject A','subject B')
set(gca,'xlim',[0 6], 'XTick',[1 2 3 4 5  ], 'XTickLabel',...
    {'sub 1/2', 'sub 3/4','sub 5/6','sub 7/8','sub 9/10'});
%%
[h,p,k,c]=lillietest(proportion_chosen_all_new) % 0 means the data is from 
%the normal distribution
% the answer is 0
%%
[h,p,k,c]=lillietest(sum_all)% 0 means the data is from 
%the normal distribution
% the answer is 0
%%
corr_preferred_sumreward=corrcoef(proportion_chosen_all_new, sum_all)
[R,P]=corrcoef(proportion_chosen_all_new,sum_all,'alpha',0.05)
%orr_preferred_sumreward = 1.0000    0.2732
                         % 0.2732    1.0000
figure('Name','Correlation between proportion chosen and reward')
hold on
scatter(proportion_chosen_all_new,sum_all)
lsline
ylabel('reward amount')
xlabel('proportion of chosen preferred')

hold off
                         
%%
figure('Name','RT over time for all two subjects')
subplot(6,2,1)
bar(RT_all_1)
title('RT of 1 subject')
xlabel('trials')
ylabel('RT in ms')
subplot(6,2,2)
bar(RT_all_2)
title('RT of 2 subject')
xlabel('trials')
ylabel('RT in ms')
subplot(6,2,3)
bar(reward_all_1)
title('reward subject 1')
subplot(6,2,4)
bar(reward_all_2)
title('reward subject 2')
subplot(6,2,5)
bar(RT_all_3)
title('RT of 3 subject')
xlabel('trials')
ylabel('RT in ms')
subplot(6,2,6)
bar(RT_all_4)
title('RT of 4 subject')
xlabel('trials')
ylabel('RT in ms')
subplot(6,2,7)
bar(reward_all_3)
title('reward subject 3')
subplot(6,2,8)
bar(reward_all_4)
title('reward subject 4')
subplot(6,2,9)
bar(RT_all_5)
title('RT of 5 subject')
xlabel('trials')
ylabel('RT in ms')
subplot(6,2,10)
bar(RT_all_6)
title('RT of 6 subject')
xlabel('trials')
ylabel('RT in ms')
subplot(6,2,11)
bar(reward_all_5)
title('reward subject 5')
subplot(6,2,12)
bar(reward_all_6)
title('reward subject 6')

% plot RT and rewards for subjects over time 
figure('Name','RT and rewards of subjects 7-10 over time')
subplot(4,2,1)
bar(RT_all_7)
title('RT of 7 subject')
xlabel('trials')
ylabel('RT in ms')
subplot(4,2,2)
bar(RT_all_8)
title('RT of 8 subject')
xlabel('trials')
ylabel('RT in ms')
subplot(4,2,3)
bar(reward_all_7)
title('reward subject 7')
subplot(4,2,4)
bar(reward_all_8)
title('reward subject 8')
subplot(4,2,5)
bar(RT_all_9)
title('RT of 9 subject')
xlabel('trials')
ylabel('RT in ms')
subplot(4,2,6)
bar(RT_all_10)
title('RT of 10 subject')
xlabel('trials')
ylabel('RT in ms')
subplot(4,2,7)
bar(reward_all_9)
title('reward subject 9')
subplot(4,2,8)
bar(reward_all_10)
title('reward subject 10')
%%

RT_up_1=[];
RT_down_1=[];

RT_up_2=[];
RT_down_2=[];

RT_up_3=[];
RT_down_3=[];

RT_up_4=[];
RT_down_4=[];

RT_up_5=[];
RT_down_5=[];

RT_up_6=[];
RT_down_6=[];

RT_up_7=[];
RT_down_7=[];

RT_up_8=[];
RT_down_8=[];

RT_up_9=[];
RT_down_9=[];

RT_up_10=[];
RT_down_10=[];

for ii=1:length(Table_human)
    if (Table_human(ii,1)==21001) & (Table_human(ii,2)==219)
        RT_up_1=[RT_up_1,Table_human(ii,4)];
        mean_RT_up_1=mean(RT_up_1);
    else if (Table_human(ii,1)==21001) & (Table_human(ii,2)==782)
        RT_down_1=[RT_down_1,Table_human(ii,4)];
        mean_RT_down_1=mean(RT_down_1);
        else if (Table_human(ii,1)==22002) & (Table_human(ii,2)==219)
        RT_up_2=[RT_up_2,Table_human(ii,4)];
        mean_RT_up_2=mean(RT_up_2);
            else if (Table_human(ii,1)==22002) & (Table_human(ii,2)==782)
        RT_down_2=[RT_down_2,Table_human(ii,4)];
        mean_RT_down_2=mean(RT_down_2);
                else if (Table_human(ii,1)==21003) & (Table_human(ii,2)==219)
        RT_up_3=[RT_up_3,Table_human(ii,4)];
        mean_RT_up_3=mean(RT_up_3);
                    else if (Table_human(ii,1)==21003) & (Table_human(ii,2)==782)
        RT_down_3=[RT_down_3,Table_human(ii,4)];
        mean_RT_down_3=mean(RT_down_3);
                        else if (Table_human(ii,1)==22004) & (Table_human(ii,2)==219)
        RT_up_4=[RT_up_4,Table_human(ii,4)];
        mean_RT_up_4=mean(RT_up_4);
                            else if (Table_human(ii,1)==22004) & (Table_human(ii,2)==782)
        RT_down_4=[RT_down_4,Table_human(ii,4)];
        mean_RT_down_4=mean(RT_down_4);
                                else if (Table_human(ii,1)==21005) & (Table_human(ii,2)==219)
        RT_up_5=[RT_up_5,Table_human(ii,4)];
        mean_RT_up_5=mean(RT_up_5);
                                    else if (Table_human(ii,1)==21005) & (Table_human(ii,2)==782)
        RT_down_5=[RT_down_5,Table_human(ii,4)];
        mean_RT_down_5=mean(RT_down_5);
                                        else if (Table_human(ii,1)==12006) & (Table_human(ii,2)==219)
        RT_up_6=[RT_up_6,Table_human(ii,4)];
        mean_RT_up_6=mean(RT_up_6);
                                            else if (Table_human(ii,1)==12006) & (Table_human(ii,2)==782)
        RT_down_6=[RT_down_6,Table_human(ii,4)];
        mean_RT_down_6=mean(RT_down_6);
                                                else if (Table_human(ii,1)==21007) & (Table_human(ii,2)==219)
        RT_up_7=[RT_up_7,Table_human(ii,4)];
        mean_RT_up_7=mean(RT_up_7);
                                                    else if (Table_human(ii,1)==21007) & (Table_human(ii,2)==782)
        RT_down_7=[RT_down_7,Table_human(ii,4)];
        mean_RT_down_7=mean(RT_down_7);
                                                        else if (Table_human(ii,1)==12008) & (Table_human(ii,2)==219)
        RT_up_8=[RT_up_8,Table_human(ii,4)];
        mean_RT_up_8=mean(RT_up_8);
                                                            else if (Table_human(ii,1)==12008) & (Table_human(ii,2)==782)
        RT_down_8=[RT_down_8,Table_human(ii,4)];
        mean_RT_down_8=mean(RT_down_8);
                                                                else if (Table_human(ii,1)==21009) & (Table_human(ii,2)==219)
        RT_up_9=[RT_up_9,Table_human(ii,4)];
        mean_RT_up_9=mean(RT_up_9);
                                                                    else if (Table_human(ii,1)==21009) & (Table_human(ii,2)==782)
        RT_down_9=[RT_down_9,Table_human(ii,4)];
        mean_RT_down_9=mean(RT_down_9);
                                                                        else if (Table_human(ii,1)==12010) & (Table_human(ii,2)==219)
        RT_up_10=[RT_up_10,Table_human(ii,4)];
        mean_RT_up_10=mean(RT_up_10);
                                                                            else if (Table_human(ii,1)==12010) & (Table_human(ii,2)==782)
        RT_down_10=[RT_down_10,Table_human(ii,4)];
        mean_RT_down_10=mean(RT_down_10);
                                                                                else
                                                                                    disp('no value')
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
%
figure('Name','Mean RT for up and down position per subject')
all_mean_RT=[mean_RT_up_1,mean_RT_down_1; mean_RT_up_2,mean_RT_down_2;...
    mean_RT_up_3,mean_RT_down_3; mean_RT_up_4,mean_RT_down_4;...
    mean_RT_up_5, mean_RT_down_5; mean_RT_up_6,mean_RT_down_6;...
    mean_RT_up_7,mean_RT_down_7;mean_RT_up_8,mean_RT_down_8;...
    mean_RT_up_9,mean_RT_down_9;mean_RT_up_10,mean_RT_down_10];
bar(all_mean_RT);
title('RT for up/down position per subject');
ylabel('RT for positions')
legend('up','down')
set(gca,'xlim',[0 11], 'XTick',[1 2 3 4 5 6 7 8 9 10], 'XTickLabel',...
    {'sub 1', 'sub 2','sub 3','sub 4','sub 5','sub 6','sub 7','sub 8','sub 9','sub 10' });
%%

% prepare for ttest for diff between RT for up/down
RT_up=[];
RT_down=[];
for ia=1:length(Table_human)
    if Table_human(ia,2)==219
        RT_up=[RT_up,Table_human(ia,4)];
        mean_up=mean(RT_up);
    else if Table_human(ia,2)==782
            RT_down=[RT_down,Table_human(ia,4)];
            mean_down=mean(RT_down);
        else
            disp('no value')
        end
    end
end

% perfrom ttest for RT for up/down
[h,p,ci,stats] = ttest2(RT_up,RT_down); 
%h =1; p =2.2838e-16; ci =-45.0178  -27.7149
%stats =  tstat: -8.2411 df: 4022 sd: 133.4849

%%
%prepare for ttest for RT preferred/unpreferred
RT_preferred_A=[];
RT_not_preferred_A=[];
RT_preferred_B=[];
RT_not_preferred_B=[];
for aa=1:length(Table_human)
    if (Table_human(aa,2)==Table_human(aa,3)) & (Table_human(aa,7)==1)
        RT_preferred_A=[RT_preferred_A,Table_human(aa,4)];
        mean_preferred_A=mean(RT_preferred_A);
    else if (Table_human(aa,2)~=Table_human(aa,3)) & (Table_human(aa,7)==0)
            RT_not_preferred_A=[RT_not_preferred_A,Table_human(aa,4)];
            mean_notpreferred_A=mean(RT_not_preferred_A);
        else if (Table_human(aa,2)~=Table_human(aa,3)) & (Table_human(aa,7)==1)
    RT_preferred_B=[RT_preferred_B,Table_human(aa,4)];
    mean_preferred_B=mean(RT_preferred_B);
            else if (Table_human(aa,2)==Table_human(aa,3)) & (Table_human(aa,7)==0)
RT_not_preferred_B=[RT_not_preferred_B,Table_human(aa,4)];
mean_notptreferred_B=mean(RT_not_preferred_B);
                else
                    disp('no value')
                end
            end
        end
    end
end
RT_preferred=[RT_preferred_A RT_preferred_B];
RT_not_preferred=[RT_not_preferred_A RT_not_preferred_B];

[h,p,ci,stats] = ttest2(RT_preferred, RT_not_preferred)
%h = 1   p =7.0642e-08    ci =14.6411   31.3343
%stats = struct with fields:  tstat: 5.3996
     %df: 4022
     %sd: 134.1220
%%

% prepare for diff in RT up/down, preferred/not preferred
RT_UP_preferred_A=[];
RT_DOWN_preferred_A=[];
RT_UP_not_preferred_A=[];
RT_DOWN_not_preferred_A=[];

RT_UP_preferred_B=[];
RT_DOWN_preferred_B=[];
RT_UP_not_preferred_B=[];
RT_DOWN_not_preferred_B=[];

for iii=1:length(Table_human)
    if (Table_human(iii,2)==Table_human(iii,3)) & (Table_human(iii,7)==1)& (Table_human(iii,2)==219)
        RT_UP_preferred_A=[RT_UP_preferred_A, Table_human(iii,4)];
    else if (Table_human(iii,2)==Table_human(iii,3)) & (Table_human(iii,7)==1)& (Table_human(iii,2)==782)
        RT_DOWN_preferred_A=[RT_DOWN_preferred_A,Table_human(iii,4)];
    else if (Table_human(iii,2)~=Table_human(iii,3)) & (Table_human(iii,7)==0) & (Table_human(iii,2)==219)
            RT_UP_not_preferred_A=[RT_UP_not_preferred_A, Table_human(iii,4)];
        else if (Table_human(iii,2)~=Table_human(iii,3)) & (Table_human(iii,7)==0) & (Table_human(iii,2)==782)
                RT_DOWN_not_preferred_A=[RT_DOWN_not_preferred_A,Table_human(iii,4)];
            else if (Table_human(iii,2)~=Table_human(iii,3)) & (Table_human(iii,7)==1) & (Table_human(iii,2)==219)
                RT_UP_preferred_B=[RT_UP_preferred_B,Table_human(iii,4)];
                else if (Table_human(iii,2)~=Table_human(iii,3)) & (Table_human(iii,7)==1) & (Table_human(iii,2)==782)
                     RT_DOWN_preferred_B=[RT_DOWN_preferred_B, Table_human(iii,4)];
                    else if (Table_human(iii,2)==Table_human(iii,3)) & (Table_human(iii,7)==0)& (Table_human(iii,2)==219)
                        RT_UP_not_preferred_B=[RT_UP_not_preferred_B,Table_human(iii,4)];
                        else if (Table_human(iii,2)==Table_human(iii,3)) & (Table_human(iii,7)==0)& (Table_human(iii,2)==782)
                           RT_DOWN_not_preferred_B=[RT_DOWN_not_preferred_B, Table_human(iii,4)];    
    else
        disp('no value')
                            end
                        end
                    end
                end
            end
        end
    end
    end
end
  
RT_up_preferred_all=[RT_UP_preferred_A,RT_UP_preferred_B];
RT_down_preferred_all=[RT_DOWN_preferred_A,RT_DOWN_preferred_B];

RT_up_not_preferred_all=[RT_UP_not_preferred_A,RT_UP_not_preferred_B];
RT_down_not_preferred_all=[RT_DOWN_not_preferred_A,RT_DOWN_not_preferred_B];

[h,p,ci,stats] = ttest2(RT_up_preferred_all,RT_down_preferred_all)
%h =1
%p =1.0268e-10
%ci = 26.8263   50.0376
%stats = struct with fields:tstat: 6.4939    df: 2243     sd: 135.0186


%%
%% ANOVA1
% with the help of anova1 look for the differences
% in the mean of RT depending on the position of the target.
Position_categorical=categorical(Table_human(:,2));
RT_total=Table_human(:,4);% position
%%

% ANOVA FOR RT DEPENDING ON THE POSITION FOR SUBJECT A
[p,tbl]=anova1(RT_total,Position_categorical); %RT* position
%[p,tbl]=anova1(RT_instructed,S_categorical); is significant!!!!!
Fstat = tbl{2,5};
pvalue = tbl{2,6};
[~,~,stats]=anova1(RT_total,Position_categorical);
[c,~,~,gnames] = multcompare(stats);
Group_diff_position=cell2table([gnames(c(:,1)), gnames(c(:,2)), num2cell(c(:,3:6))],'VariableNames',{'group1','group2', 'min','mean','max','pvalue'});

%%
Target_categorical=categorical(Table_human(:,7));
%%
[p,tbl]=anova1(RT_total,Target_categorical); %RT* position
%[p,tbl]=anova1(RT_instructed,S_categorical); is significant!!!!!
Fstat = tbl{2,5};
pvalue = tbl{2,6};
[~,~,stats]=anova1(RT_total,Target_categorical);
[c,~,~,gnames] = multcompare(stats);
Diff_RT_pref_pos_A=cell2table([gnames(c(:,1)), gnames(c(:,2)), num2cell(c(:,3:6))],'VariableNames',{'group1','group2', 'min','mean','max','pvalue'});


%% ANOVA2 or ANOVAN (for 2 comparisons)
% look for the interaction effect between RT, position preferance of the
% target
[p,tbl]=anovan(RT_total,{Position_categorical, Target_categorical},'model',2,'varnames',{'position','targetchoice'});
Fstat = tbl{2,5};
pvalue = tbl{2,6};
[~,~,stats]=anovan(RT_total,{Position_categorical, Target_categorical},'model',2,'varnames',{'position','targetchoice'});
[c,~,~,gnames] = multcompare(stats);
Group_diff_interaction_A=cell2table([gnames(c(:,1)), gnames(c(:,2)), num2cell(c(:,3:6))],'VariableNames',{'group1','group2', 'min','mean','max','pvalue'});
%[p,tbl]=anovan(RT_instructed,{P_categorical, H_categorical, S_categorical},'model',2,'varnames',{'position','hand', 'side'});
%%

%%
%%

% calculate number of different reward amounts per subject (how many
% 1-point rewards, 2-point rewards, 3-point rewards, 4-point rewards they
% got)

% this for subject 1
point_1_1=[];
point_2_1=[];
point_3_1=[];
point_4_1=[];
for au=1:length(Table_human)
    if (Table_human(au,1)==21001) && (Table_human(au,6)==1)
      point_1_1=[point_1_1, Table_human(au,6)]; 
      points_1_1=numel(point_1_1);
    else if (Table_human(au,1)==21001) && (Table_human(au,6)==2)
      point_2_1=[point_2_1, Table_human(au,6)]; 
      points_2_1=numel(point_2_1);
        else if (Table_human(au,1)==21001) && (Table_human(au,6)==3)
      point_3_1=[point_3_1, Table_human(au,6)];
      points_3_1=numel(point_3_1);
            else if (Table_human(au,1)==21001) && (Table_human(au,6)==4)
      point_4_1=[point_4_1, Table_human(au,6)]; 
      points_4_1=numel(point_4_1);
    else
        disp('no value');
    end
            end
        end
    end
end

%%

% for subject 2
point_1_2=[];
point_2_2=[];
point_3_2=[];
point_4_2=[];
for auq=1:length(Table_human)
    if (Table_human(auq,1)==22002) && (Table_human(auq,6)==1)
      point_1_2=[point_1_2, Table_human(auq,6)]; 
      points_1_2=numel(point_1_2);
    else if (Table_human(auq,1)==22002) && (Table_human(auq,6)==2)
      point_2_2=[point_2_2, Table_human(auq,6)]; 
      points_2_2=numel(point_2_2);
        else if (Table_human(auq,1)==22002) && (Table_human(auq,6)==3)
      point_3_2=[point_3_2, Table_human(auq,6)];
      points_3_2=numel(point_3_2);
            else if (Table_human(auq,1)==22002) && (Table_human(auq,6)==4)
      point_4_2=[point_4_2, Table_human(auq,6)]; 
      points_4_2=numel(point_4_2);
    else
        disp('no value');
    end
            end
        end
    end
end
%%
point_1_3=[];
point_2_3=[];
point_3_3=[];
point_4_3=[];
for auq=1:length(Table_human)
    if (Table_human(auq,1)==21003) && (Table_human(auq,6)==1)
      point_1_3=[point_1_3, Table_human(auq,6)]; 
      points_1_3=numel(point_1_3);
    else if (Table_human(auq,1)==21003) && (Table_human(auq,6)==2)
      point_2_3=[point_2_3, Table_human(auq,6)]; 
      points_2_3=numel(point_2_3);
        else if (Table_human(auq,1)==21003) && (Table_human(auq,6)==3)
      point_3_3=[point_3_3, Table_human(auq,6)];
      points_3_3=numel(point_3_3);
            else if (Table_human(auq,1)==21003) && (Table_human(auq,6)==4)
      point_4_3=[point_4_3, Table_human(auq,6)]; 
      points_4_3=numel(point_4_3);
    else
        disp('no value');
    end
            end
        end
    end
end
%%
point_1_4=[];
point_2_4=[];
point_3_4=[];
point_4_4=[];
for auq=1:length(Table_human)
    if (Table_human(auq,1)==22004) && (Table_human(auq,6)==1)
      point_1_4=[point_1_4, Table_human(auq,6)]; 
      points_1_4=numel(point_1_4);
    else if (Table_human(auq,1)==22004) && (Table_human(auq,6)==2)
      point_2_4=[point_2_4, Table_human(auq,6)]; 
      points_2_4=numel(point_2_4);
        else if (Table_human(auq,1)==22004) && (Table_human(auq,6)==3)
      point_3_4=[point_3_4, Table_human(auq,6)];
      points_3_4=numel(point_3_4);
            else if (Table_human(auq,1)==22004) && (Table_human(auq,6)==4)
      point_4_4=[point_4_4, Table_human(auq,6)]; 
      points_4_4=numel(point_4_4);
    else
        disp('no value');
    end
            end
        end
    end
end
%%
point_1_5=[];
point_2_5=[];
point_3_5=[];
point_4_5=[];
for auq=1:length(Table_human)
    if (Table_human(auq,1)==21005) && (Table_human(auq,6)==1)
      point_1_5=[point_1_5, Table_human(auq,6)]; 
      points_1_5=numel(point_1_5);
    else if (Table_human(auq,1)==21005) && (Table_human(auq,6)==2)
      point_2_5=[point_2_5, Table_human(auq,6)]; 
      points_2_5=numel(point_2_5);
        else if (Table_human(auq,1)==21005) && (Table_human(auq,6)==3)
      point_3_5=[point_3_5, Table_human(auq,6)];
      points_3_5=numel(point_3_5);
            else if (Table_human(auq,1)==21005) && (Table_human(auq,6)==4)
      point_4_5=[point_4_5, Table_human(auq,6)]; 
      points_4_5=numel(point_4_5);
    else
        disp('no value');
    end
            end
        end
    end
end
%%
point_1_6=[];
point_2_6=[];
point_3_6=[];
point_4_6=[];
for auq=1:length(Table_human)
    if (Table_human(auq,1)==12006) && (Table_human(auq,6)==1)
      point_1_6=[point_1_6, Table_human(auq,6)]; 
      points_1_6=numel(point_1_6);
    else if (Table_human(auq,1)==12006) && (Table_human(auq,6)==2)
      point_2_6=[point_2_6, Table_human(auq,6)]; 
      points_2_6=numel(point_2_6);
        else if (Table_human(auq,1)==12006) && (Table_human(auq,6)==3)
      point_3_6=[point_3_6, Table_human(auq,6)];
      points_3_6=numel(point_3_6);
            else if (Table_human(auq,1)==12006) && (Table_human(auq,6)==4)
      point_4_6=[point_4_6, Table_human(auq,6)]; 
      points_4_6=numel(point_4_6);
    else
        disp('no value');
    end
            end
        end
    end
end
%%
point_1_7=[];
point_2_7=[];
point_3_7=[];
point_4_7=[];
for auq=1:length(Table_human)
    if (Table_human(auq,1)==21007) && (Table_human(auq,6)==1)
      point_1_7=[point_1_7, Table_human(auq,6)]; 
      points_1_7=numel(point_1_7);
    else if (Table_human(auq,1)==21007) && (Table_human(auq,6)==2)
      point_2_7=[point_2_7, Table_human(auq,6)]; 
      points_2_7=numel(point_2_7);
        else if (Table_human(auq,1)==21007) && (Table_human(auq,6)==3)
      point_3_7=[point_3_7, Table_human(auq,6)];
      points_3_7=numel(point_3_7);
            else if (Table_human(auq,1)==21007) && (Table_human(auq,6)==4)
      point_4_7=[point_4_7, Table_human(auq,6)]; 
      points_4_7=numel(point_4_7);
    else
        disp('no value');
    end
            end
        end
    end
end

%%
point_1_8=[];
point_2_8=[];
point_3_8=[];
point_4_8=[];
for auq=1:length(Table_human)
    if (Table_human(auq,1)==12008) && (Table_human(auq,6)==1)
      point_1_8=[point_1_8, Table_human(auq,6)]; 
      points_1_8=numel(point_1_8);
    else if (Table_human(auq,1)==12008) && (Table_human(auq,6)==2)
      point_2_8=[point_2_8, Table_human(auq,6)]; 
      points_2_8=numel(point_2_8);
        else if (Table_human(auq,1)==12008) && (Table_human(auq,6)==3)
      point_3_8=[point_3_8, Table_human(auq,6)];
      points_3_8=numel(point_3_8);
            else if (Table_human(auq,1)==12008) && (Table_human(auq,6)==4)
      point_4_8=[point_4_8, Table_human(auq,6)]; 
      points_4_8=numel(point_4_8);
    else
        disp('no value');
    end
            end
        end
    end
end
%%
point_1_9=[];
point_2_9=[];
point_3_9=[];
point_4_9=[];
for auq=1:length(Table_human)
    if (Table_human(auq,1)==21009) && (Table_human(auq,6)==1)
      point_1_9=[point_1_9, Table_human(auq,6)]; 
      points_1_9=numel(point_1_9);
    else if (Table_human(auq,1)==21009) && (Table_human(auq,6)==2)
      point_2_9=[point_2_9, Table_human(auq,6)]; 
      points_2_9=numel(point_2_9);
        else if (Table_human(auq,1)==21009) && (Table_human(auq,6)==3)
      point_3_9=[point_3_9, Table_human(auq,6)];
      points_3_9=numel(point_3_9);
            else if (Table_human(auq,1)==21009) && (Table_human(auq,6)==4)
      point_4_9=[point_4_9, Table_human(auq,6)]; 
      points_4_9=numel(point_4_9);
    else
        disp('no value');
    end
            end
        end
    end
end
%%
point_1_10=[];
point_2_10=[];
point_3_10=[];
point_4_10=[];
for auq=1:length(Table_human)
    if (Table_human(auq,1)==12010) && (Table_human(auq,6)==1)
      point_1_10=[point_1_10, Table_human(auq,6)]; 
      points_1_10=numel(point_1_10);
    else if (Table_human(auq,1)==12010) && (Table_human(auq,6)==2)
      point_2_10=[point_2_10, Table_human(auq,6)]; 
      points_2_10=numel(point_2_10);
        else if (Table_human(auq,1)==12010) && (Table_human(auq,6)==3)
      point_3_10=[point_3_10, Table_human(auq,6)];
      points_3_10=numel(point_3_10);
            else if (Table_human(auq,1)==12010) && (Table_human(auq,6)==4)
      point_4_10=[point_4_10, Table_human(auq,6)]; 
      points_4_10=numel(point_4_10);
    else
        disp('no value');
    end
            end
        end
    end
end
%%

points_1and2=[points_1_1,points_1_2; points_2_1, points_2_2;...
    points_3_1,points_3_2; points_4_1, points_4_2];

points_3and4=[points_1_3,points_1_4; points_2_3, points_2_4;...
    points_3_3,points_3_4; points_4_4, points_4_4];
    
points_5and6=[points_1_5,points_1_6; points_2_5, points_2_6;...
    points_3_5,points_3_6; points_4_5, points_4_6];

points_7and8=[points_1_7,points_1_8; points_2_7, points_2_8;...
    points_3_7,points_3_8; points_4_7, points_4_8];

 points_9and10=[points_1_9,points_1_10; points_2_9, points_2_10;...
    points_3_9,points_3_10; points_4_9, points_4_10];       
    
%%
figure('Name','number of different rewards per pair')
subplot(3,2,1)
hold on
bar(points_1and2)
title('rewards for subject 1 and 2')
legend('subject A','subject B', 'Location','northwest')
ylabel('amount of reward')
set(gca,'ylim',[0 250], 'XTick',[1 2 3 4   ], 'XTickLabel',...
    {'1 points'; '2 points';'3 points';'4 points'});
hold off
subplot(3,2,2)
hold on
bar(points_3and4)
title('rewards for subject 3 and 4')
ylabel('amount of reward')
set(gca, 'XTick',[1 2 3 4   ], 'XTickLabel',...
    {'1 points'; '2 points';'3 points';'4 points'});
hold off
subplot(3,2,3)
hold on
bar(points_5and6)
title('rewards for subject 5 and 6')

ylabel('amount of reward')
set(gca, 'XTick',[1 2 3 4   ], 'XTickLabel',...
    {'1 points'; '2 points';'3 points';'4 points'});
hold off
subplot(3,2,4)
hold on
bar(points_7and8)
title('rewards for subject 7 and 8')

ylabel('amount of reward')
set(gca, 'XTick',[1 2 3 4   ], 'XTickLabel',...
    {'1 points'; '2 points';'3 points';'4 points'});hold off
subplot(3,2,5)
hold on
bar(points_9and10)
title('rewards for subject 9 and 10')

ylabel('amount of reward')
set(gca, 'XTick',[1 2 3 4   ], 'XTickLabel',...
    {'1 points'; '2 points';'3 points';'4 points'});
hold off
%%
