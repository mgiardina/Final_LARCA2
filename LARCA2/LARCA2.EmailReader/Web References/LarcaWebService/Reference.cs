﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by Microsoft.VSDesigner, Version 4.0.30319.42000.
// 
#pragma warning disable 1591

namespace LARCA2.EmailReader.LarcaWebService {
    using System;
    using System.Web.Services;
    using System.Diagnostics;
    using System.Web.Services.Protocols;
    using System.Xml.Serialization;
    using System.ComponentModel;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.6.1038.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="LARCAJobsSoap", Namespace="http://tempuri.org/")]
    public partial class LARCAJobs : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback ProcesarEmailsOperationCompleted;
        
        private System.Threading.SendOrPostCallback EnviarPrimerosRemidersOperationCompleted;
        
        private System.Threading.SendOrPostCallback EnviarSegundosRemidersOperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public LARCAJobs() {
            this.Url = global::LARCA2.EmailReader.Properties.Settings.Default.LARCA2_EmailReader_LarcaWebService_LARCAJobs;
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event ProcesarEmailsCompletedEventHandler ProcesarEmailsCompleted;
        
        /// <remarks/>
        public event EnviarPrimerosRemidersCompletedEventHandler EnviarPrimerosRemidersCompleted;
        
        /// <remarks/>
        public event EnviarSegundosRemidersCompletedEventHandler EnviarSegundosRemidersCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/ProcesarEmails", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public void ProcesarEmails() {
            this.Invoke("ProcesarEmails", new object[0]);
        }
        
        /// <remarks/>
        public void ProcesarEmailsAsync() {
            this.ProcesarEmailsAsync(null);
        }
        
        /// <remarks/>
        public void ProcesarEmailsAsync(object userState) {
            if ((this.ProcesarEmailsOperationCompleted == null)) {
                this.ProcesarEmailsOperationCompleted = new System.Threading.SendOrPostCallback(this.OnProcesarEmailsOperationCompleted);
            }
            this.InvokeAsync("ProcesarEmails", new object[0], this.ProcesarEmailsOperationCompleted, userState);
        }
        
        private void OnProcesarEmailsOperationCompleted(object arg) {
            if ((this.ProcesarEmailsCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.ProcesarEmailsCompleted(this, new System.ComponentModel.AsyncCompletedEventArgs(invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/EnviarPrimerosRemiders", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public void EnviarPrimerosRemiders() {
            this.Invoke("EnviarPrimerosRemiders", new object[0]);
        }
        
        /// <remarks/>
        public void EnviarPrimerosRemidersAsync() {
            this.EnviarPrimerosRemidersAsync(null);
        }
        
        /// <remarks/>
        public void EnviarPrimerosRemidersAsync(object userState) {
            if ((this.EnviarPrimerosRemidersOperationCompleted == null)) {
                this.EnviarPrimerosRemidersOperationCompleted = new System.Threading.SendOrPostCallback(this.OnEnviarPrimerosRemidersOperationCompleted);
            }
            this.InvokeAsync("EnviarPrimerosRemiders", new object[0], this.EnviarPrimerosRemidersOperationCompleted, userState);
        }
        
        private void OnEnviarPrimerosRemidersOperationCompleted(object arg) {
            if ((this.EnviarPrimerosRemidersCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.EnviarPrimerosRemidersCompleted(this, new System.ComponentModel.AsyncCompletedEventArgs(invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/EnviarSegundosRemiders", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public void EnviarSegundosRemiders() {
            this.Invoke("EnviarSegundosRemiders", new object[0]);
        }
        
        /// <remarks/>
        public void EnviarSegundosRemidersAsync() {
            this.EnviarSegundosRemidersAsync(null);
        }
        
        /// <remarks/>
        public void EnviarSegundosRemidersAsync(object userState) {
            if ((this.EnviarSegundosRemidersOperationCompleted == null)) {
                this.EnviarSegundosRemidersOperationCompleted = new System.Threading.SendOrPostCallback(this.OnEnviarSegundosRemidersOperationCompleted);
            }
            this.InvokeAsync("EnviarSegundosRemiders", new object[0], this.EnviarSegundosRemidersOperationCompleted, userState);
        }
        
        private void OnEnviarSegundosRemidersOperationCompleted(object arg) {
            if ((this.EnviarSegundosRemidersCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.EnviarSegundosRemidersCompleted(this, new System.ComponentModel.AsyncCompletedEventArgs(invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.6.1038.0")]
    public delegate void ProcesarEmailsCompletedEventHandler(object sender, System.ComponentModel.AsyncCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.6.1038.0")]
    public delegate void EnviarPrimerosRemidersCompletedEventHandler(object sender, System.ComponentModel.AsyncCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.6.1038.0")]
    public delegate void EnviarSegundosRemidersCompletedEventHandler(object sender, System.ComponentModel.AsyncCompletedEventArgs e);
}

#pragma warning restore 1591