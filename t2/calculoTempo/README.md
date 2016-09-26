# Matrizes comparando tempo médio com e sem paralelismo
Comparação dos resultados executando com três tipos de execuções:
 - Sem paralelismo: execução sequencial;
 - Com paralelismo (Completo): execução com paralelismo openMP;
 - Com paralelismo: execução com paralelismo, porém, a parte de criação das matrizes de entrada não é paralelizada.
 
| Sem Paralelismo | Com Paralelismo (Completo) | Com Paralismo
|---|---|---|
| 19.5760002  | 17.7959995  | 18.0879993  |
| 19.7439995  | 17.5319996  | 17.7239990  |
| 19.7080002  | 17.5960007  | 17.3199997  |
| 19.6320000  | 17.4880009  | 17.8560009  |
| 18.6399994  | 17.4559994  | 18.0760002  |
| 19.1840000  | 17.5119991  | 17.0279999  |
| 19.1040001  | 17.4599991  | 19.1040001  |
| 19.2080002  | 17.1399994  | 18.2360001  |
| 18.5799999  | 17.6639996  | 17.9120007  |
| 18.2800007  | 17.9279995  | 17.9839993  |
| 19.8239994  | 17.3600006  | 17.7679996  |
| 19.4160004  | 17.1000004  | 17.3680000  |
| 19.6119995  | 17.8959999  | 17.6599998  |
| 19.6720009  | 17.0639992  | 17.7199993  |
| 18.9839993  | 17.9880009  | 18.0799999  |
| 19.3400002  | 17.6520004  | 17.7080002  |
| 19.0680008  | 17.9599991  | 17.3840008  |
| 18.9120007  | 18.1639996  | 17.2479992  |
| 19.6879997  | 18.0240002  | 16.5559998  |
| 19.7360001  | 17.7679996  | 16.4640007  |
| Tempo medio: 19.2954  | Tempo medio: 17.6274  | Tempo medio: 17.6642  |
