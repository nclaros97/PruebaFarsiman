namespace PruebaFarsiman
{
    partial class MenuPrincipal
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.POpciones = new System.Windows.Forms.Panel();
            this.btnColaboradores = new System.Windows.Forms.Button();
            this.PInfoSesion = new System.Windows.Forms.Panel();
            this.lblCorreo = new System.Windows.Forms.Label();
            this.lblNombreCompeto = new System.Windows.Forms.Label();
            this.pictureBox7 = new System.Windows.Forms.PictureBox();
            this.PContenedor = new System.Windows.Forms.Panel();
            this.btnViajes = new System.Windows.Forms.Button();
            this.POpciones.SuspendLayout();
            this.PInfoSesion.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox7)).BeginInit();
            this.SuspendLayout();
            // 
            // POpciones
            // 
            this.POpciones.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(20)))), ((int)(((byte)(30)))), ((int)(((byte)(35)))));
            this.POpciones.Controls.Add(this.btnViajes);
            this.POpciones.Controls.Add(this.btnColaboradores);
            this.POpciones.Dock = System.Windows.Forms.DockStyle.Left;
            this.POpciones.Location = new System.Drawing.Point(0, 0);
            this.POpciones.Name = "POpciones";
            this.POpciones.Size = new System.Drawing.Size(241, 642);
            this.POpciones.TabIndex = 0;
            // 
            // btnColaboradores
            // 
            this.btnColaboradores.AccessibleDescription = "";
            this.btnColaboradores.AccessibleName = "Formulario Usuarios";
            this.btnColaboradores.Cursor = System.Windows.Forms.Cursors.Default;
            this.btnColaboradores.FlatAppearance.BorderSize = 0;
            this.btnColaboradores.FlatAppearance.MouseDownBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(69)))), ((int)(((byte)(76)))));
            this.btnColaboradores.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(38)))), ((int)(((byte)(45)))), ((int)(((byte)(53)))));
            this.btnColaboradores.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnColaboradores.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnColaboradores.ForeColor = System.Drawing.Color.Silver;
            this.btnColaboradores.Image = global::PruebaFarsiman.Properties.Resources.clientes;
            this.btnColaboradores.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnColaboradores.Location = new System.Drawing.Point(5, 81);
            this.btnColaboradores.Name = "btnColaboradores";
            this.btnColaboradores.Size = new System.Drawing.Size(230, 40);
            this.btnColaboradores.TabIndex = 15;
            this.btnColaboradores.Text = "    Colaboradores";
            this.btnColaboradores.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnColaboradores.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnColaboradores.UseVisualStyleBackColor = true;
            this.btnColaboradores.Click += new System.EventHandler(this.btnColaboradores_Click);
            // 
            // PInfoSesion
            // 
            this.PInfoSesion.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(55)))), ((int)(((byte)(61)))), ((int)(((byte)(69)))));
            this.PInfoSesion.Controls.Add(this.lblCorreo);
            this.PInfoSesion.Controls.Add(this.lblNombreCompeto);
            this.PInfoSesion.Controls.Add(this.pictureBox7);
            this.PInfoSesion.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.PInfoSesion.Location = new System.Drawing.Point(241, 529);
            this.PInfoSesion.Name = "PInfoSesion";
            this.PInfoSesion.Size = new System.Drawing.Size(881, 113);
            this.PInfoSesion.TabIndex = 1;
            // 
            // lblCorreo
            // 
            this.lblCorreo.AutoSize = true;
            this.lblCorreo.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCorreo.ForeColor = System.Drawing.Color.LightGray;
            this.lblCorreo.Location = new System.Drawing.Point(77, 45);
            this.lblCorreo.Name = "lblCorreo";
            this.lblCorreo.Size = new System.Drawing.Size(49, 16);
            this.lblCorreo.TabIndex = 10;
            this.lblCorreo.Text = "Correo";
            // 
            // lblNombreCompeto
            // 
            this.lblNombreCompeto.AutoSize = true;
            this.lblNombreCompeto.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNombreCompeto.ForeColor = System.Drawing.Color.LightGray;
            this.lblNombreCompeto.Location = new System.Drawing.Point(77, 27);
            this.lblNombreCompeto.Name = "lblNombreCompeto";
            this.lblNombreCompeto.Size = new System.Drawing.Size(118, 16);
            this.lblNombreCompeto.TabIndex = 9;
            this.lblNombreCompeto.Text = "Nombre Completo";
            // 
            // pictureBox7
            // 
            this.pictureBox7.Image = global::PruebaFarsiman.Properties.Resources.user;
            this.pictureBox7.Location = new System.Drawing.Point(6, 27);
            this.pictureBox7.Name = "pictureBox7";
            this.pictureBox7.Size = new System.Drawing.Size(65, 65);
            this.pictureBox7.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox7.TabIndex = 8;
            this.pictureBox7.TabStop = false;
            // 
            // PContenedor
            // 
            this.PContenedor.BackColor = System.Drawing.Color.Silver;
            this.PContenedor.Dock = System.Windows.Forms.DockStyle.Fill;
            this.PContenedor.Location = new System.Drawing.Point(241, 0);
            this.PContenedor.Name = "PContenedor";
            this.PContenedor.Size = new System.Drawing.Size(881, 529);
            this.PContenedor.TabIndex = 2;
            // 
            // btnViajes
            // 
            this.btnViajes.AccessibleDescription = "";
            this.btnViajes.AccessibleName = "Formulario Usuarios";
            this.btnViajes.Cursor = System.Windows.Forms.Cursors.Default;
            this.btnViajes.FlatAppearance.BorderSize = 0;
            this.btnViajes.FlatAppearance.MouseDownBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(69)))), ((int)(((byte)(76)))));
            this.btnViajes.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(38)))), ((int)(((byte)(45)))), ((int)(((byte)(53)))));
            this.btnViajes.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnViajes.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnViajes.ForeColor = System.Drawing.Color.Silver;
            this.btnViajes.Image = global::PruebaFarsiman.Properties.Resources.clientes;
            this.btnViajes.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnViajes.Location = new System.Drawing.Point(5, 127);
            this.btnViajes.Name = "btnViajes";
            this.btnViajes.Size = new System.Drawing.Size(230, 40);
            this.btnViajes.TabIndex = 16;
            this.btnViajes.Text = "    Viajes";
            this.btnViajes.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnViajes.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnViajes.UseVisualStyleBackColor = true;
            this.btnViajes.Click += new System.EventHandler(this.btnViajes_Click);
            // 
            // MenuPrincipal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1122, 642);
            this.Controls.Add(this.PContenedor);
            this.Controls.Add(this.PInfoSesion);
            this.Controls.Add(this.POpciones);
            this.Name = "MenuPrincipal";
            this.Text = "MenuPrincipal";
            this.Load += new System.EventHandler(this.MenuPrincipal_Load);
            this.POpciones.ResumeLayout(false);
            this.PInfoSesion.ResumeLayout(false);
            this.PInfoSesion.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox7)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel POpciones;
        private System.Windows.Forms.Panel PInfoSesion;
        private System.Windows.Forms.Panel PContenedor;
        private System.Windows.Forms.Label lblCorreo;
        private System.Windows.Forms.Label lblNombreCompeto;
        private System.Windows.Forms.PictureBox pictureBox7;
        private System.Windows.Forms.Button btnColaboradores;
        private System.Windows.Forms.Button btnViajes;
    }
}