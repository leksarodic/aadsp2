: Delete log files first.
cd OutCmp
del whiteNoise_Model0_vs_Model1.txt
del whiteNoise_Model1_vs_Model2.txt
del whiteNoise_Model2_vs_Model3.txt

cd ..

: Delete wav outputs
cd OutStream
del WhiteNoise_model0_out.wav
del WhiteNoise_model1_out.wav
del WhiteNoise_model2_out.wav
del WhiteNoise_model3_out.wav

cd ..

: Execute Model 0, Model 1, Model 2 and Model 3
cd Debug
"mixerNxM_model0.exe" "../../../TestStreams/WhiteNoise.wav" "../OutStream/WhiteNoise_model0_out.wav"
"mixerNxM_model1.exe" "../../../TestStreams/WhiteNoise.wav" "../OutStream/WhiteNoise_model1_out.wav"
"mixerNxM_model2.exe" "../../../TestStreams/WhiteNoise.wav" "../OutStream/WhiteNoise_model2_out.wav"

cd ..

C:\CirrusDSP\bin\cmdline_simulator.exe -project mixerNxM_model3//SimulatorConfigurationTemp.sbr -max_cycles 1000000

: Generate new logs
"..//..//tools//PCMCompare.exe" "OutStream//WhiteNoise_model0_out.wav" "OutStream//WhiteNoise_model1_out.wav" 2> "OutCmp//WhiteNoise_Model0_vs_Model1.txt"
"..//..//tools//PCMCompare.exe" "OutStream//WhiteNoise_model1_out.wav" "OutStream//WhiteNoise_model2_out.wav" 2> "OutCmp//WhiteNoise_Model1_vs_Model2.txt"
"..//..//tools//PCMCompare.exe" "OutStream//WhiteNoise_model2_out.wav" "OutStream//WhiteNoise_model3_out.wav" 2> "OutCmp//WhiteNoise_Model2_vs_Model3.txt"
