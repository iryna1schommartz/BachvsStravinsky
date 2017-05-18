
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



% randomised position of the red target seen by subject A
randomised_pos_A=data_panel.data(informed_hits_idx,data_panel.cn.A_RandomizedTargetPosition_Y);
pos_up_A=find(data_panel.data(informed_hits_idx,data_panel.cn.A_RandomizedTargetPosition_Y)==782);
pos_down_A=find(data_panel.data(informed_hits_idx,data_panel.cn.A_RandomizedTargetPosition_Y)==219);
% randomised position of the red target seen by subject A
randomised_pos_B=data_panel.data(informed_hits_idx,data_panel.cn.B_RandomizedTargetPosition_Y);
pos_up_B=find(data_panel.data(informed_hits_idx,data_panel.cn.B_RandomizedTargetPosition_Y)==782);
pos_down_B=find(data_panel.data(informed_hits_idx,data_panel.cn.B_RandomizedTargetPosition_Y)==219);

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

% create a column in a matrix for ID of the subject 1, using the number of
% rows from the RT matrix
% use the appropriate subject name
ID_A=repmat(21001, numel(RT_informed_A),1);

% create array with all necessary data for subject 1
Table_A=[ID_A Y_coor_A  randomised_pos_A RT_informed_A reward_accumulated_A reward_per_trial_A preferred_chosen_A];

% create a column in a matrix for ID of the subject 2, using the number of
% rows from the RT matrix
% use the appropriate subject name
ID_B=repmat(22002,numel(RT_informed_B),1);

% create array with all necessary data for subject 1
Table_B=[ID_B Y_coor_B  randomised_pos_B RT_informed_B reward_accumulated_B reward_per_trial_B preferred_chosen_B];

% unite the data for both subjects into one table
Table_AB=[Table_A; Table_B];

Table_AB_1=table(Table_AB);

%%
% write out the text file for the table
% use appropriate name
writetable(Table_AB_1,'Table_AB_new_1.txt');
%,'Delimiter','\t','WriteRowNames',true)  
%type 'myData.txt'
