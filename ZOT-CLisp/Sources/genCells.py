def gen_space_cells():
    formulae = list()
    i=0
    for y in range(1,8):
        for x in range (1,18):
            formulae.append('(defvar pos{}_{} {})'.format(x,y,20*i+x))
        i +=1
    return formulae

if __name__ == '__main__':
    with open('space_constants_autogen.lisp', 'w') as f:
        for elem in gen_space_cells():
            f.write(elem + '\n')
