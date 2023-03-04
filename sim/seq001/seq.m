
HOME_PROJECT = "t:\matlab\";
NAME_SEQ = "seq001";
USER = getenv("USERS");


% Add to MATLAB path:
folder = fullfile(HOME_PROJECT, USER, 'sim', NAME_SEQ);
addpath(folder);

% Add to Python path:
folder = fullfile(HOME_PROJECT, USER,'model', 'diff_enc');
% Add to Python path:
P = py.sys.path;
if count(P,folder) == 0
    insert(P,int32(0),folder);
end

% Add to Python path:
folder = fullfile(HOME_PROJECT, USER,'model', 'diff_dec');
% Add to Python path:
P = py.sys.path;
if count(P,folder) == 0
    insert(P,int32(0),folder);
end

% Load Python module
clear classes
M_diff_enc = py.importlib.import_module('diff_enc');
M_diff_dec = py.importlib.import_module('diff_dec');

py.importlib.reload(M_diff_enc);
py.importlib.reload(M_diff_dec);
diff_enc_int = M_diff_enc.Diff_enc.feval(2.0);
diff_dec_int = M_diff_dec.Diff_dec.feval(3.9);

% Stimulis
var = [1,2,3,4,5];

% Process encoder
pyvar = py.numpy.array(var);
enc = double(M_diff_enc.Diff_enc.diff_enc('m', pyvar))

% Process decoder
pyvar = py.numpy.array(enc);
dec = double(M_diff_dec.Diff_dec.diff_dec('m', pyvar))

diff_dec_int.init
diff_enc_int.init
