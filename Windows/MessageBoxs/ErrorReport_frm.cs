﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace DevProLauncher.Windows.MessageBoxs
{
    public partial class ErrorReport_frm : Form
    {
        public ErrorReport_frm(Exception error)
        {
            InitializeComponent();
            label1.Text = Program.LanguageManager.Translation.pMsbException;
            ErrorReport.Text += error;
        }
    }
}
