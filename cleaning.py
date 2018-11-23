import sys
import getopt


def main(argv):
    filename = 'Delitos.csv'

    try:
        opts, args = getopt.getopt(argv, "hf:")
    except:
        print('cleaning.py -f <filename>')
        sys.exit(1)

    for opt, arg in opts:
        if opt == '-h':
            print('cleaning.py -f <filename>')
            sys.exit(1)
        elif opt == '-f':
            filename = arg


    print(filename)


if __name__ == '__main__':
    main(sys.argv[1:])
