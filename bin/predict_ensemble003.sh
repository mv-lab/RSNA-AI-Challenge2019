set -ex

model=model003
gpu=0
ep=1
tta=5
clip=1e-6

test0=./model/${model}/fold0_ep${ep}_test_tta${tta}.pkl
test1=./model/${model}/fold1_ep${ep}_test_tta${tta}.pkl
test2=./model/${model}/fold2_ep${ep}_test_tta${tta}.pkl
test3=./model/${model}/fold3_ep${ep}_test_tta${tta}.pkl
test4=./model/${model}/fold4_ep${ep}_test_tta${tta}.pkl
sub=./data/submission/ensemble_${model}_ep${ep}_test_tta${tta}.csv

#python -m src.cnn.main test ${conf} --snapshot ${snapshot} --output ${test} --n-tta ${tta} --fold ${fold} --gpu ${gpu}
python -m src.postprocess.make_submission --inputs "['${test0}','${test1}','${test2}','${test3}','${test4}']" --output ${sub} --clip ${clip}
kaggle competitions submit rsna-intracranial-hemorrhage-detection -m "se-resnext101 on v100 ensemble" -f ${sub}

