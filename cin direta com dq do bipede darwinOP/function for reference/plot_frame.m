function  plot_frame(Td)
%PLOT_FRAME plota o frame de uma transformacao com relacao ao frame 000
    quat_unit = [1 0 0 0];
    o = [quat_unit (1/2)*quat_mult(quat_unit, [0 0 0 0])];
    x = [quat_unit (1/2)*quat_mult(quat_unit, [0 1 0 0])];
    y = [quat_unit (1/2)*quat_mult(quat_unit, [0 0 1 0])];
    z = [quat_unit (1/2)*quat_mult(quat_unit, [0 0 0 1])];
    
    o = dual_quat_mult(Td, o);
    x = dual_quat_mult(Td, x);
    y = dual_quat_mult(Td, y);
    z = dual_quat_mult(Td, z);
    
    o = 2*quat_mult(o(5:8), [o(1) -o(2:4)]);
    x = 2*quat_mult(x(5:8), [x(1) -x(2:4)]);
    y = 2*quat_mult(y(5:8), [y(1) -y(2:4)]);
    z = 2*quat_mult(z(5:8), [z(1) -z(2:4)]);
    
    vtx = x(1:4) - o(1:4);
    vty = y(1:4) - o(1:4);
    vtz = z(1:4) - o(1:4);

    quiver3( o(2),  o(3),  o(4), vtx(2), vtx(3), vtx(4), 0, 'color','red')
    quiver3( o(2),  o(3),  o(4), vty(2), vty(3), vty(4), 0, 'color','green')
    quiver3( o(2),  o(3),  o(4), vtz(2), vtz(3), vtz(4), 0, 'color','blue')

    scatter3(o(2), o(3), o(4), 55, [ 0.8 0.8 0.3], 'filled');
    scatter3(o(2), o(3), o(4), 55);
end

