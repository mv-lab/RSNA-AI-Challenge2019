set -ex

model=model001
gpu=0
ep=2
tta=5
clip=1e-6

test10=./model/${model}/fold0_ep${ep}_test_tta${tta}.pkl
test11=./model/${model}/fold1_ep${ep}_test_tta${tta}.pkl
test12=./model/${model}/fold2_ep${ep}_test_tta${tta}.pkl
test13=./model/${model}/fold3_ep${ep}_test_tta${tta}.pkl
test14=./model/${model}/fold4_ep${ep}_test_tta${tta}.pkl

model=model002
gpu=0
ep=2
tta=5
clip=1e-6

test20=./model/${model}/fold0_ep${ep}_test_tta${tta}.pkl
test21=./model/${model}/fold1_ep${ep}_test_tta${tta}.pkl
test22=./model/${model}/fold2_ep${ep}_test_tta${tta}.pkl
test23=./model/${model}/fold3_ep${ep}_test_tta${tta}.pkl
test24=./model/${model}/fold4_ep${ep}_test_tta${tta}.pkl
sub=./data/submission/ensemble_all_test_tta${tta}.csv

model=model003
gpu=0
ep=1
tta=5
clip=1e-6

test30=./model/${model}/fold0_ep${ep}_test_tta${tta}.pkl
test31=./model/${model}/fold1_ep${ep}_test_tta${tta}.pkl
test32=./model/${model}/fold2_ep${ep}_test_tta${tta}.pkl
test33=./model/${model}/fold3_ep${ep}_test_tta${tta}.pkl
test34=./model/${model}/fold4_ep${ep}_test_tta${tta}.pkl

#python -m src.cnn.main test ${conf} --snapshot ${snapshot} --output ${test} --n-tta ${tta} --fold ${fold} --gpu ${gpu}
python -m src.postprocess.make_submission --inputs "['${test10}','${test11}','${test12}','${test13}','${test14}','${test20}','${test21}','${test22}','${test23}','${test24}','${test30}','${test31}','${test32}','${test33}','${test34}']" --output ${sub} --clip ${clip}
kaggle competitions submit rsna-intracranial-hemorrhage-detection -m  "ensemble all" -f ${sub}

