def generate_isCartMovingSlow_one_cell_per_time(): # isCartMovingSlow ∧ isCartAt(x, y) →Dist(isCartAt(x + 1, y) ∨ isCartAt(x, y + 1)
                                                        #∨ isCartAt(x − 1, y) ∨ isCartAt(x, y − 1), 1)
    x_y_tuples = list()
    formula = '(-> (&& (-P- isCartMovingSlow) (-P- isCartAt_%X%_%Y%) ) (|| '
    formula_xp = '(dist (-P- isCartAt_%Xp1%_%Y%) 1)'
    formula_yp = '(dist (-P- isCartAt_%X%_%Yp1% ) 1)'
    formula_xm = '(dist (-P- isCartAt_%Xm1%_%Y% ) 1)'
    formula_ym = '(dist (-P- isCartAt_%X%_%Ym1% ) 1)'
    formulae = list()
    for x in range(2, 14): # Range is [from, to) ;-)
        for y in range(1, 4):
            xp1 = x+1 if x < 13 else 'VALUE_OOB'
            xm1 = x-1 if x > 2 else 'VALUE_OOB'
            yp1 = y+1 if y < 3 else 'VALUE_OOB'
            ym1 = y-1 if y > 1 else 'VALUE_OOB'

            formulae.append(
                do_repl(formula,x,y,xp1,xm1,yp1,ym1) +
                (do_repl(formula_xp, x, y, xp1, xm1, yp1, ym1) if x<13 else '') +
                (do_repl(formula_yp, x, y, xp1, xm1, yp1, ym1) if y<3 else '') +
                (do_repl(formula_ym, x, y, xp1, xm1, yp1, ym1) if y>1 else '')
            )

    return list(map(lambda l: l+'))\n', formulae))

def do_repl(ins, x,y,xp1,xm1,yp1,ym1):
    return ins.replace('%X%', str(x)).replace('%Y%', str(y)).replace('%Yp1%', str(yp1)).replace('%Ym1%', str(ym1)).replace('%Xp1%', str(xp1)).replace('%Xm1%', str(xm1))

def write_f(outf='formulae_autogen_py.lisp'):
    with open(outf, 'w') as f:
        for x in generate_isCartMovingSlow_one_cell_per_time():
            f.write(x)
