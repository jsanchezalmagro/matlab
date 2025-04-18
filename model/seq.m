%% Initial
clear
clc
PROJECT_ROOT = getenv("PROJECT_ROOT");
%PROJECT_ROOT = "/projects/eurodrone_wb_mdm/jose.sanchez/03_fw";
%% Configuration

waveform_cfg = fullfile(PROJECT_ROOT, '00_submodules', 'cfg',   'waveform_cfg.json');

addpath(fullfile(PROJECT_ROOT, "03_design",  "ipm_shaping",     "matlab"));

addpath(fullfile(PROJECT_ROOT, "04_sil_test", "testbench",      "agent_agc",         "matlab"));

addpath(fullfile(PROJECT_ROOT, "04_sil_test", "testbench",      "setup_ipm_shaping", "matlab"));

addpath(fullfile(PROJECT_ROOT, "04_sil_test", "verification",   "seqUT4000_simulink_shaping"));

WORK_PATH = fullfile(PROJECT_ROOT,"work", "simulink", "shaping");
if not(isfolder(WORK_PATH))
    mkdir(WORK_PATH)
end
cd(WORK_PATH)

%% Init simulink
load_system('setup_ipm_shaping.slx');
open_system('setup_ipm_shaping');
load("shaping.mat");
%% Load data from json
fid = fopen(waveform_cfg, 'r');
raw = fread(fid, inf, 'char');
fclose(fid);
jsonString = char(raw');
jsonData = jsondecode(jsonString);

c_srrc_coef    = jsonData.shaping.c_srrc_coef;
c_int1_coef    = jsonData.shaping.c_int1_coef;
c_int2_coef    = jsonData.shaping.c_int2_coef;

LSB = 1/(2^14);

%% run 10.71 Mb
% Selec waveform, '0' is 2Mb, '1' is 10.71 Mb, '2' is 21.42, '3' is 44.73
c_delay_golden = 7;
c_waveform = 1; % 
% c_phase_offset     = 0; % Degree
sample_i = qpsk_1071.sample_i;
sample_q = qpsk_1071.sample_q;
sample_i_golden = shaping_1071.sample_i;
sample_q_golden = shaping_1071.sample_q;
Runtime = 130000;
sim_1071 = sim('setup_ipm_shaping', Runtime);

% Check the result
display("Waveform 10.71 Mb")

if (sum(sim_1071.errors_i) == 0) 
    display("I is OK");
else
    display("I is FAIL");
end

if (sum(sim_1071.errors_q) == 0) 
    display("Q is OK");
else
    display("Q is FAIL");
end

%% run 21.42 Mb
% Selec waveform, '0' is 2Mb, '1' is 10.71 Mb, '2' is 21.42, '3' is 44.73
c_delay_golden = 3;
c_waveform = 2; % 
% c_phase_offset     = 0; % Degree
sample_i = qpsk_2142.sample_i;
sample_q = qpsk_2142.sample_q;
sample_i_golden = shaping_2142.sample_i;
sample_q_golden = shaping_2142.sample_q;
Runtime = 65000;
sim_2142 = sim('setup_ipm_shaping', Runtime);


% Check the result
display("Waveform 21.42 Mb")

if (sum(sim_2142.errors_i) == 0) 
    display("I is OK");
else
    display("I is FAIL");
end

if (sum(sim_2142.errors_q) == 0) 
    display("Q is OK");
else
    display("Q is FAIL");
end

%% run 44.73 Mb
% Selec waveform, '0' is 2Mb, '1' is 10.71 Mb, '2' is 21.42, '3' is 44.73
c_delay_golden = 1;
c_waveform = 3; % 
% c_phase_offset     = 0; % Degree
sample_i = qpsk_4473.sample_i;
sample_q = qpsk_4473.sample_q;
sample_i_golden = shaping_4473.sample_i;
sample_q_golden = shaping_4473.sample_q;
Runtime = 130000;
sim_4473 = sim('setup_ipm_shaping', Runtime);

% Check the result
display("Waveform 44.73 Mb")

if (sum(sim_4473.errors_i) == 0) 
    display("I is OK");
else
    display("I is FAIL");
end

if (sum(sim_4473.errors_q) == 0) 
    display("Q is OK");
else
    display("Q is FAIL");
end