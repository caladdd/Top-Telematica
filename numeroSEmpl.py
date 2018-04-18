from mrjob.job import MRJob
import numpy as np

class EmpresasPromSE(MRJob):

    def mapper(self, _, line):

	empresas = line.split(",")
	yield empresas[1], int(empresas[0])

    def reducer(self, key, values):
	cont = 0
        lista = []
	for c in values:
            lista.append(c)
        mset = set(lista)
        for v in mset:
            cont+=1
	yield key, cont

if __name__ == '__main__':
    EmpresasPromSE.run()

