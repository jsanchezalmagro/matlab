% Define Python modules by USER 
modules = ["diff_enc", "diff_dec"];

% PATH define, not modife--------------------------------------------------
currentFolder = pwd;
modelFolder = fullfile(currentFolder,"..","..");
% Add to MATLAB path:
addpath(currentFolder);
% Add to Python path to ps.sys.path:
P = py.sys.path;
for module = modules
    folder = fullfile(modelFolder, module);
    if count(P,folder) == 0
        insert(P,int32(0),folder);
    end
end
%--------------------------------------------------------------------------

% Load Python module
%clear classes
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

%diff_dec_int.base
%diff_enc_int.base

