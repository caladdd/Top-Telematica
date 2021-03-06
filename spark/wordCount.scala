val textFile = sc.textFile("hdfs:///datasets/gutenberg-small/*.txt")
val counts = textFile.flatMap(line => line.split(" "))
                 .map(word => (word, 1))
                 .reduceByKey(_ + _)
counts.saveAsTextFile("hdfs:///user/jcaladh/spout1")