import sys
import getopt
import pandas as pd
import numpy as np

def split_crime_time(filename):
    df = pd.read_csv(filename)

    df['HORA_INICIO'], df['HORA_FIN'] = df['HORA'].str.split(' A ', 1).str

    df['HORA_FIN'] = np.where(pd.isna(df['HORA_FIN']), df['HORA_INICIO'], df['HORA_FIN'])

    df.to_csv('output.csv')

def main(argv):
    filename = 'Delitos.csv'

    try:
        opts, args = getopt.getopt(argv, "hf:t")
    except:
        print('cleaning.py -f <filename> -t')
        sys.exit(1)

    for opt, arg in opts:
        if opt == '-h':
            print('cleaning.py -f <filename>')
            sys.exit(1)
        elif opt == '-f':
            filename = arg
        elif opt == '-t':
            split_crime_time(filename)

    print('Finished')


if __name__ == '__main__':
    main(sys.argv[1:])
