/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gui;

import java.awt.Toolkit;
import java.awt.event.WindowEvent;

/**
 *
 * @author Watto
 */
public class RegisterGUI extends javax.swing.JDialog {
    private String campoNome;
    private String campoUser;
    private String campoSenha;
    private String campoPlano;
    private String campoCardNumber;
    private String campoDate;
    private String campoCVV;

    /** Creates new form RegisterGUI */
    public RegisterGUI(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        
        c_field_cardnumber.setEnabled(false);
        c_field_date.setEnabled(false);
        c_field_cvv.setEnabled(false);
        
        setLocationRelativeTo(null);
        setResizable(false);
    }

    public void close(){
        WindowEvent closeWindow = new WindowEvent(this, WindowEvent.WINDOW_CLOSING);
        Toolkit.getDefaultToolkit().getSystemEventQueue().postEvent(closeWindow);
    }
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        c_info = new javax.swing.JPanel();
        c_label_nome = new javax.swing.JLabel();
        c_label_user = new javax.swing.JLabel();
        c_label_password = new javax.swing.JLabel();
        c_label_plano = new javax.swing.JLabel();
        c_label_cardnumber = new javax.swing.JLabel();
        c_label_date = new javax.swing.JLabel();
        c_label_cvv = new javax.swing.JLabel();
        c_field_user = new javax.swing.JTextField();
        c_field_password = new javax.swing.JTextField();
        c_combo_plano = new javax.swing.JComboBox<>();
        c_field_name = new javax.swing.JTextField();
        c_button_save = new javax.swing.JButton();
        c_button_cancel = new javax.swing.JButton();
        c_field_date = new javax.swing.JFormattedTextField();
        c_field_cardnumber = new javax.swing.JFormattedTextField();
        c_field_cvv = new javax.swing.JFormattedTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Cadastrar novo Usuário");

        c_info.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)), "Cadastro de Usuário"));

        c_label_nome.setText("Nome:");

        c_label_user.setText("Usuário:");

        c_label_password.setText("Senha:");

        c_label_plano.setText("Plano:");

        c_label_cardnumber.setText("Número do Cartão:");

        c_label_date.setText("Data do Cartão:");

        c_label_cvv.setText("CVV:");

        c_combo_plano.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Free", "Premium" }));
        c_combo_plano.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                c_combo_planoActionPerformed(evt);
            }
        });

        c_button_save.setText("Salvar");
        c_button_save.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                c_button_saveActionPerformed(evt);
            }
        });

        c_button_cancel.setText("Cancelar");
        c_button_cancel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                c_button_cancelActionPerformed(evt);
            }
        });

        try {
            c_field_date.setFormatterFactory(new javax.swing.text.DefaultFormatterFactory(new javax.swing.text.MaskFormatter("##/####")));
        } catch (java.text.ParseException ex) {
            ex.printStackTrace();
        }

        try {
            c_field_cardnumber.setFormatterFactory(new javax.swing.text.DefaultFormatterFactory(new javax.swing.text.MaskFormatter("#### #### #### ####")));
        } catch (java.text.ParseException ex) {
            ex.printStackTrace();
        }

        try {
            c_field_cvv.setFormatterFactory(new javax.swing.text.DefaultFormatterFactory(new javax.swing.text.MaskFormatter("###")));
        } catch (java.text.ParseException ex) {
            ex.printStackTrace();
        }

        org.jdesktop.layout.GroupLayout c_infoLayout = new org.jdesktop.layout.GroupLayout(c_info);
        c_info.setLayout(c_infoLayout);
        c_infoLayout.setHorizontalGroup(
            c_infoLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(c_infoLayout.createSequentialGroup()
                .addContainerGap()
                .add(c_infoLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING, false)
                    .add(c_infoLayout.createSequentialGroup()
                        .add(c_infoLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                            .add(c_label_user)
                            .add(c_label_password)
                            .add(c_label_plano)
                            .add(c_label_nome))
                        .add(50, 50, 50)
                        .add(c_infoLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING, false)
                            .add(c_combo_plano, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                            .add(c_field_user, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 315, Short.MAX_VALUE)
                            .add(c_field_password)
                            .add(org.jdesktop.layout.GroupLayout.TRAILING, c_field_name)))
                    .add(c_infoLayout.createSequentialGroup()
                        .add(c_infoLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                            .add(c_label_cardnumber)
                            .add(c_label_date)
                            .add(c_label_cvv))
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                        .add(c_infoLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                            .add(org.jdesktop.layout.GroupLayout.TRAILING, c_infoLayout.createSequentialGroup()
                                .add(0, 125, Short.MAX_VALUE)
                                .add(c_button_save, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 85, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                                .add(c_button_cancel, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 85, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                            .add(org.jdesktop.layout.GroupLayout.TRAILING, c_field_date)
                            .add(c_field_cardnumber)
                            .add(c_field_cvv))))
                .addContainerGap(20, Short.MAX_VALUE))
        );
        c_infoLayout.setVerticalGroup(
            c_infoLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(c_infoLayout.createSequentialGroup()
                .addContainerGap()
                .add(c_infoLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(c_label_nome)
                    .add(c_field_name, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                .add(c_infoLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(c_label_user)
                    .add(c_field_user, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                .add(c_infoLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(c_label_password)
                    .add(c_field_password, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                .add(c_infoLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(c_label_plano)
                    .add(c_combo_plano, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(18, 18, 18)
                .add(c_infoLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(c_label_cardnumber)
                    .add(c_field_cardnumber, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                .add(c_infoLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(c_label_date)
                    .add(c_field_date, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                .add(c_infoLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(c_label_cvv)
                    .add(c_field_cvv, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(39, 39, 39)
                .add(c_infoLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(c_button_save)
                    .add(c_button_cancel))
                .addContainerGap(77, Short.MAX_VALUE))
        );

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(c_info, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(13, 13, 13)
                .add(c_info, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .add(14, 14, 14))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void c_combo_planoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_c_combo_planoActionPerformed
        // TODO add your handling code here:
        if(c_combo_plano.getItemAt(c_combo_plano.getSelectedIndex()) == "Free"){
            c_field_cardnumber.setText("");
            c_field_date.setText("");
            c_field_cvv.setText("");
            c_field_cardnumber.setEnabled(false);
            c_field_date.setEnabled(false);
            c_field_cvv.setEnabled(false);
        } else {
            c_field_cardnumber.setEnabled(true);
            c_field_date.setEnabled(true);
            c_field_cvv.setEnabled(true);
        }
        
    }//GEN-LAST:event_c_combo_planoActionPerformed

    private void c_button_saveActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_c_button_saveActionPerformed
        
        if(c_field_name.getText().equals("") || c_field_user.getText().equals("") || c_field_password.getText().equals("") ){
            ErrorGUI err = new ErrorGUI(this, true);
            err.setVisible(true);
            
        } else if(c_combo_plano.getItemAt(c_combo_plano.getSelectedIndex()) == "Premium" && (c_field_cardnumber.getText().equals("                   ") || c_field_date.getText().equals("  /    ") || c_field_cvv.getText().equals("   "))){
            ErrorGUI err = new ErrorGUI(this, true);
            err.setVisible(true);
        } else {
        //no empty fields
            this.campoNome = this.c_field_name.getText();
            this.campoUser = this.c_field_user.getText();
            this.campoSenha = this.c_field_password.getText();
            this.campoPlano = this.c_combo_plano.getItemAt(c_combo_plano.getSelectedIndex());
            this.campoCardNumber = this.c_field_cardnumber.getText();
            this.campoDate = this.c_field_date.getText();
            this.campoCVV = this.c_field_cvv.getText();
        
            this.dispose();
        }
    }//GEN-LAST:event_c_button_saveActionPerformed

    private void c_button_cancelActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_c_button_cancelActionPerformed
        close();
        
    }//GEN-LAST:event_c_button_cancelActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(RegisterGUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(RegisterGUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(RegisterGUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(RegisterGUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                //new RegisterGUI().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton c_button_cancel;
    private javax.swing.JButton c_button_save;
    private javax.swing.JComboBox<String> c_combo_plano;
    private javax.swing.JFormattedTextField c_field_cardnumber;
    private javax.swing.JFormattedTextField c_field_cvv;
    private javax.swing.JFormattedTextField c_field_date;
    private javax.swing.JTextField c_field_name;
    private javax.swing.JTextField c_field_password;
    private javax.swing.JTextField c_field_user;
    private javax.swing.JPanel c_info;
    private javax.swing.JLabel c_label_cardnumber;
    private javax.swing.JLabel c_label_cvv;
    private javax.swing.JLabel c_label_date;
    private javax.swing.JLabel c_label_nome;
    private javax.swing.JLabel c_label_password;
    private javax.swing.JLabel c_label_plano;
    private javax.swing.JLabel c_label_user;
    // End of variables declaration//GEN-END:variables

    /**
     * @return the campoNome
     */
    public String getCampoNome() {
        return campoNome;
    }

    /**
     * @return the campoUser
     */
    public String getCampoUser() {
        return campoUser;
    }

    /**
     * @return the campoSenha
     */
    public String getCampoSenha() {
        return campoSenha;
    }

    /**
     * @return the campoPlano
     */
    public String getCampoPlano() {
        return campoPlano;
    }

    /**
     * @return the campoCardNumber
     */
    public String getCampoCardNumber() {
        return campoCardNumber;
    }

    /**
     * @return the campoDate
     */
    public String getCampoDate() {
        return campoDate;
    }

    /**
     * @return the campoCVV
     */
    public String getCampoCVV() {
        return campoCVV;
    }

}