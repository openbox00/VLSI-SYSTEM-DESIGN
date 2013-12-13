`timescale 1ns/10ps

module rgb_ycbcr(clk,reset,in_data,Y,Cb,Cr,enable);
    input clk,reset;
    input [23:0] in_data;
    output[15:0] Y,Cb,Cr;
    output enable;
    //reg[23:0] in_data_r;
    reg[7:0] R,G,B;
    reg[15:0] Y,Y_R,Y_G,Y_B;
    reg[15:0] Cb,Cb_R,Cb_G,Cb_B;
    reg[15:0] Cr,Cr_R,Cr_G,Cr_B;
    reg[15:0] Y_R_r,Y_G_r,Y_B_r;
    reg[15:0] Cb_R_r,Cb_G_r,Cb_B_r;
    reg[15:0] Cr_R_r,Cr_G_r,Cr_B_r;
    reg[15:0] Y_reg,Cb_reg,Cr_reg;
    reg enable;         
    reg[1:0]state,next_state; 
    
    
    always@(posedge clk)
    begin
        if(!reset)
        begin        
            state <= next_state;            
            Y_R_r <= Y_R;
            Y_G_r <= Y_G;
            Y_B_r <= Y_B;
            Cb_R_r <= Cb_R;
            Cb_G_r <= Cb_G;
            Cb_B_r <= Cb_B;
            Cr_R_r <= Cr_R;
            Cr_G_r <= Cr_G;
            Cr_B_r <= Cr_B;            
            {R,G,B} <= in_data;
            Y <= Y_reg;
            Cb <= Cb_reg;
            Cr <= Cr_reg;
            //enable <= 1'd1;
        end
        else
        begin
            state <= 2'b0;
            Y_R_r <= 16'd0;
            Y_G_r <= 16'd0;
            Y_B_r <= 16'd0;
            Cb_R_r <= 16'd0;
            Cb_G_r <= 16'd0;
            Cb_B_r <= 16'd0;
            Cr_R_r <= 16'd0;
            Cr_G_r <= 16'd0;
            Cr_B_r <= 16'd0;
            {R,G,B} <= 24'b0;
            Y <= 16'd0;
            Cb <= 16'd0;
            Cr <= 16'd0;
            //enable <= 1'd0;
        end
           
    end
    
    
    
    
    
    
    always@(state or Y)
    begin
        case(state)
            2'd0:
            begin 
                next_state=2'd1;
                enable = 1'd0;
            end
            2'd1:
            begin 
                next_state=2'd2;
                enable = 1'd0;
            end
            2'd2:
            begin 
                next_state=2'd3;
                enable = 1'd0;
            end
            default:
            begin
                next_state=state;
                if(Y>=16'd0 || Y<=16'd255)
                    enable = 1'd1;
                else
                    enable = 1'd0;
            end            
        endcase
    end
    
    always@(R or G or B)
    begin   
        
                Y_R = R*8'd77;//76.54
                Y_G = G*8'd150;//150.272
                Y_B = B*8'd29;//29.184
                Cb_R = R*(-8'd43);//-43.19744
                Cb_G = G*(-8'd85);//-84.80256
                Cb_B = B*8'd128;//128
                Cr_R = R*8'd128;//128
                Cr_G = G*(-8'd107);// -107.18464
                Cr_B = B*(-8'd21); //-20.81536
                
    end
    
    always@(Y_R_r or Y_G_r or Y_B_r or Cb_R_r or Cb_G_r or Cb_B_r or Cr_R_r or Cr_G_r or Cr_B_r)
    begin  
                Y_reg = Y_R_r+Y_G_r+Y_B_r;
                Cb_reg = Cb_R_r+Cb_G_r+Cb_B_r+16'd32768;
                Cr_reg = Cr_R_r+Cr_G_r+Cr_B_r+16'd32768;
    end
    
    

        
endmodule

