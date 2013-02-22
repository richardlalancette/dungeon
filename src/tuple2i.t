% Author Richard Lalancette
% based on java tuple2i
unit
class Tuple2i
    export  var x, var y, 
            create, createXY, equals, equalsXY, createTuple2i, destroy, 
            add, add2Tuple2i, 
            sub, sub2Tuple2i, 
            scale, scaleTuple2i, scaleAdd, scaleAddTuple2i, 
            negate, negateTuple2i, 
            toString,
            clamp, clampMin, clampMax, clampMinMaxTuple2i, clampMinTuple2i, clampMaxTuple2i,
            absolute, absoluteTuple2i
    
    var x : int := 0
    var y : int := 0
    
    procedure create()
        x := 0
        y := 0
    end create

    procedure createXY(X:int, Y:int)
        x := X
        y := Y
    end createXY

    function equals( t: ^ Tuple2i) : boolean
        if x = t -> x and y = t -> y then
            result true
        end if
        result false
    end equals

    function equalsXY( X:int, Y:int) : boolean
        if x = X and y = Y then
            result true
        end if
        result false
    end equalsXY

    procedure createTuple2i(t : ^ Tuple2i)
        if( t not= nil ) then
            x := t->x
            y := t->y
        end if
    end createTuple2i

    procedure destroy()
    end destroy
    
    procedure add( t : ^ Tuple2i )
        if( t not= nil ) then
            x += t->x
            y += t->y
        end if
    end add

    procedure add2Tuple2i( t1 : ^ Tuple2i, t2 : ^ Tuple2i  )
        if( t1 not= nil and t2 not= nil ) then
            x := t1->x + t2->x
            y := t1->y + t2->y
        end if
    end add2Tuple2i

    procedure sub( t : ^Tuple2i )
        if( t not= nil ) then
            x -= t->x
            y -= t->y
        end if
    end sub

    procedure sub2Tuple2i( t1 : ^ Tuple2i, t2 : ^ Tuple2i  )
        if( t1 not= nil and t2 not= nil ) then
            x := t1->x - t2->x
            y := t1->y - t2->y
        end if
    end sub2Tuple2i

    procedure scale( s:int )
        x *= s
        y *= s
    end scale

    procedure scaleTuple2i( s:int, t : ^Tuple2i )
        if( t not= nil ) then
            x := s*t->x
            y := s*t->y
        end if
    end scaleTuple2i
    
    procedure scaleAdd( s:int, t : ^Tuple2i )
        if( t not= nil ) then
            x := s*x + t->x
            y := s*y + t->y
        end if
    end scaleAdd

    procedure scaleAddTuple2i( s:int, t1 : ^ Tuple2i, t2 : ^ Tuple2i )
        if( t1 not= nil and t2 not= nil ) then
            x := s*t1->x + t2->x
            y := s*t1->y + t2->y
        end if
    end scaleAddTuple2i

    procedure negate()
        x := -x
        y := -y
    end negate

    procedure negateTuple2i(t : ^ Tuple2i)
        if( t not= nil ) then
            x := - t->x
            y := - t->y
        end if
    end negateTuple2i
    
    function toString() : string
        var r : string := "(" + intstr(x) + ", " + intstr(y) + ")";
        result r
    end toString
    
    procedure clamp( min : int, max: int )
        if( x > max ) then
            x := max;
        elsif( x < min ) then
          x := min;
        end if
        
        if( y > max ) then
            y := max;
        elsif( y < min ) then
          y := min;
        end if
    end clamp

    procedure clampMinMaxTuple2i( min : int, max:int, t : ^Tuple2i )
        if( t not= nil ) then
            if( t->x > max ) then
              x := max;
            elsif( t->x < min ) then
              x := min;
            else 
              x := t->x;
            end if

            if( t->y > max ) then
              y := max;
            elsif( t->y < min ) then
              y := min;
            else 
              y := t->y;
            end if
        end if
    end clampMinMaxTuple2i
    
    procedure clampMin( min : int, t : ^Tuple2i )
        if( t not= nil ) then
            if( t->x < min ) then
              x := min;
            else
              x := t->x;
            end if

            if( t->y < min ) then
              y := min;
            else
              y := t->y;
            end if
        end if
    end clampMin

    procedure clampMax( max : int )
            if( x > max ) then
                x := max;
            end if

            if( y > max ) then
                y := max;
            end if
    end clampMax
    
    procedure clampMinTuple2i( min : int )
            if( x < min ) then
              x := min;
            end if

            if( y < min ) then
              y := min;
            end if
    end clampMinTuple2i

    procedure clampMaxTuple2i( max : int, t : ^Tuple2i )
        if( t not= nil ) then
            if( t->x > max ) then
                x := max;
            else
                x := t->x;
            end if

            if( t->y > max ) then
                y := max;
            else
                y := t->y;
            end if
        end if
    end clampMaxTuple2i
    
    procedure absolute()
        x := abs(x)
        y := abs(y)
    end absolute

    procedure absoluteTuple2i(t : ^ Tuple2i)
        if( t not= nil ) then
            x := abs(t->x)
            y := abs(t->y)
        end if
    end absoluteTuple2i

end Tuple2i