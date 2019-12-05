Program SuperficieFiguras;
{Uso de registros con variantes}
const 
    PI = 3.14;
type
    figura = (circulo, rectangulo);
    dibujo = record 
        superficie: real;
        case forma:figura of
            circulo: (radio : real);
            rectangulo: (largo, ancho : real)
        end;


var
    d: dibujo;
    resp: char;
    
function convertir (letra: char): figura;
{Convierte un codigo de letra en un valor del tipo enumerado figura}
begin
    case letra of
        'c', 'C': convertir := circulo;
        'r', 'R': convertir := rectangulo;
    end {case}
end; {convertir}

begin
    writeln ('Selecciona tipo de figura ');
    writeln ('R: rectangulo, C: circulo');
    readln (resp);
    d.forma := convertir(resp);
    
    case d.forma of
        circulo: begin
                    writeln ('Introduce el radio: ');
                    readln (d.radio);
                    d.superficie := PI * sqr (d.radio);
                end;
        rectangulo: begin
                        writeln ('Introduce el largo y el ancho: ');
                        readln (d.largo, d.ancho);
                        d.superficie := d.largo * d.ancho;
                    end
    end;
    
case d.forma of
    circulo: writeln('Radio= ', d.radio:2:1);
    rectangulo: writeln('Dimensiones= ', d.largo:2:1, ' y ', d.ancho:2:1);
end;
writeln('Superficie= ', d.superficie:1:1);
                        

end.