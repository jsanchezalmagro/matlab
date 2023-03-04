clear classes
M_diff_enc = py.importlib.import_module('diff_enc');
M_diff_dec = py.importlib.import_module('diff_dec');

py.importlib.reload(M_diff_enc);
py.importlib.reload(M_diff_dec);
diff_enc_int = M_diff_enc.Diff_enc.feval();
diff_dec_int = M_diff_dec.Diff_dec.feval();

var = [1,2,3,4,5];

pyvar = py.numpy.array(var);
enc = double(M_diff_enc.Diff_enc.diff_enc('m', pyvar))

pyvar = py.numpy.array(enc);
dec = double(M_diff_dec.Diff_dec.diff_dec('m', pyvar))

