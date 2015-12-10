main: main.c culzss  gpu_compress deculzss  gpu_decompress decompression
	gcc -g -L /usr/local/cuda/lib64/ -o main main.c culzss.o gpu_compress.o deculzss.o gpu_decompress.o decompression.o -lcudart -lpthread

decompression: 	decompression.c decompression.h
	gcc -g  -c -lpthread -o decompression.o decompression.c
	
culzss:  culzss.c culzss.h 
	gcc -g  -c -lpthread -o culzss.o culzss.c 

gpu_compress: gpu_compress.cu gpu_compress.h
	nvcc -O3 -g -c -arch sm_20  -lpthread -o gpu_compress.o gpu_compress.cu       

deculzss:  deculzss.c deculzss.h 
	gcc -g  -c -lpthread -o deculzss.o deculzss.c

gpu_decompress: gpu_decompress.cu gpu_decompress.h
	nvcc -c -g   -lpthread -o gpu_decompress.o gpu_decompress.cu      
	
clean:
	rm *.o

