%% Data load
%read and open log data in the form of a struct
data_panel=fnParseEventIDEReportSCPv06();

%% DEFINE ALL VARIABLES TO WORK WITH

% define hit(trials with recieved reward)
hits_idx = find(data_panel.data(:,data_panel.cn.A_Outcome) == 1);

% define only informed trials
informed_idx = find(data_panel.data(:,data_panel.cn.A_TrialType) == 3);

% find all presented targets to calculate accuracy
target_presented_idx = find(data_panel.data(:,data_panel.cn.A_TargetOnsetTime_ms) > 0);

% find choice+hits
informed_hits_idx = intersect(hits_idx, informed_idx);

% define subjects 1 or A
name_A_idx=find(data_panel.data(:, data_panel.cn.A_Name_idx));

% subject A+informed hits
name_A_informed_hits_idx=intersect(name_A_idx, informed_hits_idx);

% define subject  2 or B
name_B_idx=find(data_panel.data(:, data_panel.cn.B_Name_idx));

% subject  B+informed hits
name_B_informed_hits_idx=intersect(name_B_idx, informed_hits_idx);
%

% Difference between 3 stages of reaction times: 

% 1. target/touch-target/onset
RT_informed_A=data_panel.data(informed_hits_idx,data_panel.cn.A_TargetTouchTime_ms)-data_panel.data(informed_hits_idx,  data_panel.cn.A_TargetOnsetTime_ms);

RT_informed_B=data_panel.data(informed_hits_idx,data_panel.cn.B_TargetTouchTime_ms)-data_panel.data(informed_hits_idx,  data_panel.cn.B_TargetOnsetTime_ms);
%
%%
% plot RT for both subjects over time
figure ('Name', 'RT of subject A and B')
subplot (2,1,1)
bar(RT_informed_A)
title('RT subject A')
xlabel('trials')
ylabel('reaction time')
subplot (2,1,2)
bar(RT_informed_B)
title('RT subject B')
xlabel('trials')
ylabel('reaction time')

%%
% plot a histogram of RT for each subject
figure('Name','Reachtion time A and B')
subplot(2,2,1)
histfit(RT_informed_A,30);
title('Reaction Time B')
set(gca,'xlim',[0 1600]);

subplot(2,2,2)
histfit(RT_informed_B,30);
title('Reaction Time B')
set(gca,'xlim',[0 1600]);


% plot a histogram of subjects A superimposed on subject B with the legend
subplot(2,2,3)
hold on
histogram(RT_informed_A,30);
title('Reaction Time A and B')
set(gca,'xlim',[0 1600]);
histogram(RT_informed_B,30);
legend('RT_A','RT_B')
hold off
%%

% run ttest to look whether the difference in the RT between the subjects
% is siginificant (1 is sign)
[h,p,ci,stats] = ttest2(RT_informed_A,RT_informed_B)
[hi,pi] = ttest(RT_informed_A,RT_informed_B)
%
%%
% RT for different target positions in reaches
Y_coor_A=data_panel.data(informed_hits_idx, data_panel.cn.A_TouchTarget01Position_Y); % N of hits in Y coordinate
Y_coor_B=data_panel.data(informed_hits_idx, data_panel.cn.B_TouchTarget01Position_Y); % N of hits in Y coordinate
%

% calculate rewards for each subject
% reward accumulated
reward_accumulated_A=data_panel.data(informed_hits_idx, data_panel.cn.A_AccumulatedRewardPulses);
reward_accumulated_B=data_panel.data(informed_hits_idx, data_panel.cn.B_AccumulatedRewardPulses);

%  calculate rewards for each subject per trial individually
reward_per_trial_A=data_panel.data(informed_hits_idx, data_panel.cn.A_NumberRewardPulsesDelivered_HIT);
reward_per_trial_B=data_panel.data(informed_hits_idx, data_panel.cn.B_NumberRewardPulsesDelivered_HIT);

% calculate actual rewards per trial

mean_reward_actual_A=mean(reward_per_trial_A);

mean_reward_actual_B=mean(reward_per_trial_B);

%%
% plot actual rewards of subjects per trial over time
figure('Name','Actual rewards per trial')

subplot(2,1,1)
bar_reward_actual_A=bar(reward_per_trial_A);
title('reward of subject A over time')
ylim([0 5])
ylabel('amount of reward')
xlabel('trial')

subplot(2,1,2)
bar_reward_actual_B=bar(reward_per_trial_B);
title('reward of subject B over time')
ylim([0 5])
ylabel('amount of reward')
xlabel('trial')


%%
%

% randomised position of the red target seen by subject A
randomised_pos_A=data_panel.data(informed_hits_idx,data_panel.cn.A_RandomizedTargetPosition_Y);
pos_up_A=find(data_panel.data(informed_hits_idx,data_panel.cn.A_RandomizedTargetPosition_Y)==219);
pos_down_A=find(data_panel.data(informed_hits_idx,data_panel.cn.A_RandomizedTargetPosition_Y)==782);
% randomised position of the red target seen by subject A
randomised_pos_B=data_panel.data(informed_hits_idx,data_panel.cn.B_RandomizedTargetPosition_Y);
pos_up_B=find(data_panel.data(informed_hits_idx,data_panel.cn.B_RandomizedTargetPosition_Y)==219);
pos_down_B=find(data_panel.data(informed_hits_idx,data_panel.cn.B_RandomizedTargetPosition_Y)==782);

% name for subject A (1)
name_informed_A=data_panel.data(name_A_informed_hits_idx, data_panel.cn.A_Name_idx);
% name for subject B (2)
name_informed_B=data_panel.data(name_B_informed_hits_idx, data_panel.cn.B_Name_idx);
name_informed_B(name_informed_B==1)=2;

% subjects A chooses preferred target (red)
% define the preferred/not preferred chosen for subject A
preferred_pos_A=find(data_panel.data(informed_hits_idx, data_panel.cn.A_TouchTarget01Position_Y)==...
    data_panel.data(informed_hits_idx,data_panel.cn.A_RandomizedTargetPosition_Y));
preferred_chosen_A=data_panel.data(informed_hits_idx, data_panel.cn.A_TouchTarget01Position_Y)==...
    data_panel.data(informed_hits_idx,data_panel.cn.A_RandomizedTargetPosition_Y);
unpreferred_pos_A=find(data_panel.data(informed_hits_idx, data_panel.cn.A_TouchTarget01Position_Y)~=...
    data_panel.data(informed_hits_idx,data_panel.cn.A_RandomizedTargetPosition_Y));

% define the preferred/not preferred UP/DOWN for subject A

preferred_A_up=find(data_panel.data(informed_hits_idx, data_panel.cn.A_TouchTarget01Position_Y)==...
    data_panel.data(informed_hits_idx,data_panel.cn.A_RandomizedTargetPosition_Y) & ...
    data_panel.data(informed_hits_idx, data_panel.cn.A_TouchTarget01Position_Y)==782);
preferred_A_down=find(data_panel.data(informed_hits_idx, data_panel.cn.A_TouchTarget01Position_Y)==...
    data_panel.data(informed_hits_idx,data_panel.cn.A_RandomizedTargetPosition_Y) & ...
    data_panel.data(informed_hits_idx, data_panel.cn.A_TouchTarget01Position_Y)==219);
unpreferred_A_up=find(data_panel.data(informed_hits_idx, data_panel.cn.A_TouchTarget01Position_Y)~=...
    data_panel.data(informed_hits_idx,data_panel.cn.A_RandomizedTargetPosition_Y) &...
    data_panel.data(informed_hits_idx, data_panel.cn.A_TouchTarget01Position_Y)==782);
unpreferred_A_down=find(data_panel.data(informed_hits_idx, data_panel.cn.A_TouchTarget01Position_Y)~=...
    data_panel.data(informed_hits_idx,data_panel.cn.A_RandomizedTargetPosition_Y) &...
    data_panel.data(informed_hits_idx, data_panel.cn.A_TouchTarget01Position_Y)==219);

%
% define the preferred/not preferred chosen for subject B

preferred_pos_B=find(data_panel.data(informed_hits_idx, data_panel.cn.B_TouchTarget01Position_Y)~=...
    data_panel.data(informed_hits_idx,data_panel.cn.B_RandomizedTargetPosition_Y));
preferred_chosen_B=data_panel.data(informed_hits_idx, data_panel.cn.B_TouchTarget01Position_Y)~=...
    data_panel.data(informed_hits_idx,data_panel.cn.B_RandomizedTargetPosition_Y);
unpreferred_pos_B=find(data_panel.data(informed_hits_idx, data_panel.cn.B_TouchTarget01Position_Y)==...
    data_panel.data(informed_hits_idx,data_panel.cn.B_RandomizedTargetPosition_Y));

% define the preferred/not preferred UP/DOWN for subject B
preferred_B_up=find(data_panel.data(informed_hits_idx, data_panel.cn.B_TouchTarget01Position_Y)~=...
    data_panel.data(informed_hits_idx,data_panel.cn.B_RandomizedTargetPosition_Y)&...
    data_panel.data(informed_hits_idx, data_panel.cn.B_TouchTarget01Position_Y)==782);
preferred_B_down=find(data_panel.data(informed_hits_idx, data_panel.cn.B_TouchTarget01Position_Y)~=...
    data_panel.data(informed_hits_idx,data_panel.cn.B_RandomizedTargetPosition_Y)&...
    data_panel.data(informed_hits_idx, data_panel.cn.B_TouchTarget01Position_Y)==219);
unpreferred_B_up=find(data_panel.data(informed_hits_idx, data_panel.cn.B_TouchTarget01Position_Y)==...
    data_panel.data(informed_hits_idx,data_panel.cn.B_RandomizedTargetPosition_Y)&...
    data_panel.data(informed_hits_idx, data_panel.cn.B_TouchTarget01Position_Y)==782);
unpreferred_B_down=find(data_panel.data(informed_hits_idx, data_panel.cn.B_TouchTarget01Position_Y)==...
    data_panel.data(informed_hits_idx,data_panel.cn.B_RandomizedTargetPosition_Y)&...
    data_panel.data(informed_hits_idx, data_panel.cn.B_TouchTarget01Position_Y)==219);
%%
% calculate RT for preferred chosed target (red) for subject A
RT_preferred_A=RT_informed_A(preferred_pos_A);
RT_preferred_up_A=RT_informed_A(preferred_A_up);
RT_preferred_down_A=RT_informed_A(preferred_A_down);

RT_pos_up_A=RT_informed_A(pos_up_A);
RT_pos_down_A=RT_informed_A(pos_down_A);

% calculate RT for unpreferred chosed target (yellow) for subject A
RT_unpreferred_A=RT_informed_A(unpreferred_pos_A);
RT_unpreferred_up_A=RT_informed_A(unpreferred_A_up);
RT_unpreferred_down_A=RT_informed_A(unpreferred_A_down);

RT_pos_up_B=RT_informed_B(pos_up_B);
RT_pos_down_B=RT_informed_B(pos_down_B);

% calculate RT for preferred chosed target (yellow) for subject B
RT_preferred_B=RT_informed_B(preferred_pos_B);
RT_preferred_up_B=RT_informed_B(preferred_B_up);
RT_preferred_down_B=RT_informed_B(preferred_B_down);

% calculate RT for unpreferred chosed target (red) for subject B
RT_unpreferred_B=RT_informed_B(unpreferred_pos_B);
RT_unpreferred_up_B=RT_informed_B(unpreferred_B_up);
RT_unpreferred_down_B=RT_informed_B(unpreferred_B_down);

%%

% find sign difference between RT of subject A between preferred and
% unpreferred choice
[h,p,ci,stats] = ttest2(RT_preferred_A,RT_unpreferred_A)
[h,p,ci,stats] = ttest2(RT_preferred_B,RT_unpreferred_B)
% calculate ttest for the difference between RT for prefered/unprefered
% up/down
[h,p,ci,stats] = ttest2(RT_preferred_up_A,RT_preferred_down_A)
[h,p,ci,stats] = ttest2(RT_unpreferred_up_A,RT_unpreferred_down_A)
% calculate ttest for the difference between RT for prefered/unprefered
% up/down
[h,p,ci,stats] = ttest2(RT_preferred_up_B,RT_preferred_down_B)
[h,p,ci,stats] = ttest2(RT_unpreferred_up_B,RT_unpreferred_down_B)
%%
%plot up/down for A (preferred/unpreferred)
figure ('Name','RT for preferred or unpreferred targets')
subplot(2,2,1)
bar(RT_preferred_up_A)
title('RT preferred chosen up A')
ylabel('reaction time')
xlabel('trial')
subplot(2,2,2)
bar(RT_preferred_down_A)
title('RT preferred chosen down A')
ylabel('reaction time')
xlabel('trial')
subplot(2,2,3)
bar(RT_unpreferred_up_A)
title('RT unpreferred chosen up A')
ylabel('reaction time')
xlabel('trial')
subplot(2,2,4)
bar(RT_unpreferred_down_A)
title('RT unpreferred chosen down A')
ylabel('reaction time')
xlabel('trial')
%%
%plot up/down for B (preferred/unpreferred)
figure ('Name','RT for preferred or unpreferred targets')
subplot(2,2,1)
bar(RT_preferred_up_B)
title('RT preferred chosen up B')
ylabel('reaction time')
xlabel('trial')
subplot(2,2,2)
bar(RT_preferred_down_B)
title('RT preferred chosen down B')
ylabel('reaction time')
xlabel('trial')
subplot(2,2,3)
bar(RT_unpreferred_up_B)
title('RT unpreferred chosen up B')
ylabel('reaction time')
xlabel('trial')
subplot(2,2,4)
bar(RT_unpreferred_down_B)
title('RT unpreferred chosen down B')
ylabel('reaction time')
xlabel('trial')

%%
figure ('Name','RT for preferred or unpreferred targets')
subplot(2,2,1)
bar(RT_preferred_A)
title('RT preferred chosen A')
ylabel('reaction time')
xlabel('trial')
subplot(2,2,2)
bar(RT_unpreferred_A)
title('RT unpreferred chosen A')
ylabel('reaction time')
xlabel('trial')
subplot(2,2,3)
bar(RT_preferred_B)
title('RT preferred chosen B')
ylabel('reaction time')
xlabel('trial')
subplot(2,2,4)
bar(RT_unpreferred_B)
title('RT unpreferred chosen B')
ylabel('reaction time')
xlabel('trial')

%%
ID_A=repmat(21001, numel(RT_informed_A),1);

Table_A=[ID_A Y_coor_A  randomised_pos_A RT_informed_A reward_accumulated_A reward_per_trial_A preferred_chosen_A];

ID_B=repmat(22002,numel(RT_informed_B),1);

Table_B=[ID_B Y_coor_B  randomised_pos_B RT_informed_B reward_accumulated_B reward_per_trial_B preferred_chosen_B];


Table_AB=[Table_A; Table_B];
%save ('Table_AB.mat')

%writetable(Table_AB,'Table_AB_new.txt','Deliminer',' ');
%,'Delimiter','\t','WriteRowNames',true)  
%type 'myData.txt'

%%
%Tab_informed_AB=array2table(Ta_total_AB,'VariableNames',{'Subject_name','Pos_Y','position','random_pos','RT','reward_accum','actual_reward','preferred_position'});

%% ANOVA1
% with the help of anova1 look for the differences
% in the mean of RT depending on the position of the target.
P_categorical_informed_A=categorical(Y_coor_A); % position of the target for A
P_categorical_informed_B=categorical(Y_coor_B); % position for the target for B
%%

% ANOVA FOR RT DEPENDING ON THE POSITION FOR SUBJECT A
[p,tbl]=anova1(RT_informed_A,P_categorical_informed_A); %RT* position
%[p,tbl]=anova1(RT_instructed,S_categorical); is significant!!!!!
Fstat = tbl{2,5};
pvalue = tbl{2,6};
[~,~,stats]=anova1(RT_informed_A,P_categorical_informed_A);
[c,~,~,gnames] = multcompare(stats);
Group_diff_position=cell2table([gnames(c(:,1)), gnames(c(:,2)), num2cell(c(:,3:6))],'VariableNames',{'group1','group2', 'min','mean','max','pvalue'});
%%
% ANOVA FOR RT DEPENDING ON THE POSITION FOR SUBJECT B
[p,tbl]=anova1(RT_informed_B,P_categorical_informed_B); %RT* position
%[p,tbl]=anova1(RT_instructed,S_categorical); is significant!!!!!
Fstat = tbl{2,5};
pvalue = tbl{2,6};
[~,~,stats]=anova1(RT_informed_B,P_categorical_informed_B);
[c,~,~,gnames] = multcompare(stats);
Group_diff_position_B=cell2table([gnames(c(:,1)), gnames(c(:,2)), num2cell(c(:,3:6))],'VariableNames',{'group1','group2', 'min','mean','max','pvalue'});

%%
% Target means that subject takes his of her preferred target
Target_categorical_A=categorical(data_panel.data(informed_hits_idx, data_panel.cn.A_TouchTarget01Position_Y)==...
    data_panel.data(informed_hits_idx,data_panel.cn.A_RandomizedTargetPosition_Y)); 
Target_categorical_B=categorical(data_panel.data(informed_hits_idx, data_panel.cn.B_TouchTarget01Position_Y)==...
    data_panel.data(informed_hits_idx,data_panel.cn.B_RandomizedTargetPosition_Y));

%%

% whether RT depend on the choice of the preferred target

[p,tbl]=anova1(RT_informed_A,Target_categorical_A); %RT* preferred target
%[p,tbl]=anova1(RT_instructed,S_categorical); is significant!!!!!
Fstat = tbl{2,5};
pvalue = tbl{2,6};
[~,~,stats]=anova1(RT_informed_A,Target_categorical_A);
[c,~,~,gnames] = multcompare(stats);
Diff_RT_pref_pos_A=cell2table([gnames(c(:,1)), gnames(c(:,2)), num2cell(c(:,3:6))],'VariableNames',{'group1','group2', 'min','mean','max','pvalue'});


%%

% whether RT depend on the choice of the preferred target

[p,tbl]=anova1(RT_informed_B,Target_categorical_B); %RT* preferred target
%[p,tbl]=anova1(RT_instructed,S_categorical); is significant!!!!!
Fstat = tbl{2,5};
pvalue = tbl{2,6};
[~,~,stats]=anova1(RT_informed_B,Target_categorical_B);
[c,~,~,gnames] = multcompare(stats);
Diff_RT_pref_pos_B=cell2table([gnames(c(:,1)), gnames(c(:,2)), num2cell(c(:,3:6))],'VariableNames',{'group1','group2', 'min','mean','max','pvalue'});



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example 2: Battle of sexes

%%
%

%% ANOVA2 or ANOVAN (for 2 comparisons)
% look for the interaction effect between RT, position preferance of the
% target
[p,tbl]=anovan(RT_informed_A,{P_categorical_informed_A, Target_categorical_A},'model',2,'varnames',{'position','targetchoice'});
Fstat = tbl{2,5};
pvalue = tbl{2,6};
[~,~,stats]=anovan(RT_informed_A,{P_categorical_informed_A, Target_categorical_A},'model',2,'varnames',{'position','targetchoice'});
[c,~,~,gnames] = multcompare(stats);
Group_diff_interaction_A=cell2table([gnames(c(:,1)), gnames(c(:,2)), num2cell(c(:,3:6))],'VariableNames',{'group1','group2', 'min','mean','max','pvalue'});
%[p,tbl]=anovan(RT_instructed,{P_categorical, H_categorical, S_categorical},'model',2,'varnames',{'position','hand', 'side'});
%%
[p,tbl]=anovan(RT_informed_B,{P_categorical_informed_B, Target_categorical_B},'model',2,'varnames',{'position','targetchoice'});
Fstat = tbl{2,5};
pvalue = tbl{2,6};
[~,~,stats]=anovan(RT_informed_B,{P_categorical_informed_B, Target_categorical_B},'model',2,'varnames',{'position','targetchoice'});
[c,~,~,gnames] = multcompare(stats);
Group_diff_interaction_A=cell2table([gnames(c(:,1)), gnames(c(:,2)), num2cell(c(:,3:6))],'VariableNames',{'group1','group2', 'min','mean','max','pvalue'});

%%
%%
num_A_preferred=numel(preferred_pos_A); % how many RED did the subject A choose?
num_A_unpreferred=numel(unpreferred_pos_A); 

num_B_preferred=numel(preferred_pos_B); % how many RED did the subject B choose?
num_B_unpreferred=numel(unpreferred_pos_B);

num_A_preferred_up=numel(preferred_A_up);
num_A_preferred_down=numel(preferred_A_down);
num_A_unpreferred_up=numel(unpreferred_A_up);
num_A_unpreferred_down=numel(unpreferred_A_down);

num_B_preferred_up=numel(preferred_B_up);
num_B_preferred_down=numel(preferred_B_down);
num_B_unpreferred_up=numel(unpreferred_B_up);
num_B_unpreferred_down=numel(unpreferred_B_down);

total_number_preferred_choices=[num_A_preferred, num_A_unpreferred; num_B_preferred, num_B_unpreferred];
bar_of_choices=bar(total_number_preferred_choices);
title('Number of choices for presented positions')
ylabel('number of choices')
legend('preferred','unpreferred');
set(gca, 'xlim', [0 3],'XTick', [1 2  ], 'XTickLabel', {'A decisions'; 'B decisions'})

%%
proportion_choices_for_AB=[num_A_preferred_up,num_A_unpreferred_up;...
    num_A_preferred_down,num_A_unpreferred_down;...
    num_B_preferred_up,num_B_unpreferred_up;...
    num_B_preferred_down,num_B_unpreferred_down];
figure('Name','Choices of subjects up/down preferred/not preferred')
bar_of_choice_preference=bar(proportion_choices_for_AB);
title('Choices of the subjects')
ylabel('number of choices')
legend('preferred','unpreferred');
set(gca, 'xlim', [0 5],'XTick', [1 2 3 4 ], 'XTickLabel', {'A up'; 'A down';'B up';'B down'})

%%
mean_RT_pos_up_A=mean(RT_pos_up_A);
mean_RT_pos_down_A=mean(RT_pos_down_A);

mean_RT_pos_up_B=mean(RT_pos_up_B);
mean_RT_pos_down_B=mean(RT_pos_down_B);

mean_RT_up_pref_A=mean(RT_preferred_up_A);
mean_RT_down_pref_A=mean(RT_preferred_down_A);
mean_RT_up_unpref_A=mean(RT_unpreferred_up_A);
mean_RT_down_unpref_A=mean(RT_unpreferred_down_A);

mean_RT_up_pref_B=mean(RT_preferred_up_B);
mean_RT_down_pref_B=mean(RT_preferred_down_B);
mean_RT_up_unpref_B=mean(RT_unpreferred_up_B);
mean_RT_down_unpref_B=mean(RT_unpreferred_down_B);

%%
% plot_meanRT_instructed
total_mean_for_bar=[mean_RT_pos_up_A,mean_RT_pos_up_B; mean_RT_pos_down_A, mean_RT_pos_down_B;...
    mean_RT_up_pref_A,mean_RT_up_pref_B; mean_RT_down_pref_A,mean_RT_down_pref_B;...
    mean_RT_up_unpref_A, mean_RT_up_unpref_B;mean_RT_down_unpref_A, mean_RT_down_unpref_B ];
bar_of_means=bar(total_mean_for_bar);
title('Plot of RT for different positions')
ylabel('RT for positions')
legend('A','B')
set(gca,'xlim',[0 7], 'XTick',[1 2 3 4 5 6], 'XTickLabel',{'up', 'down','pre up','pre down','un up','un down' });

