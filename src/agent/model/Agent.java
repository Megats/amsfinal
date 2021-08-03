package agent.model;
import java.util.*;

public class Agent {
		String agentid,agentname,agentgender,agentphoneno,agentaddress,agentemail;
		Date agentDateAssign;
		String agentpassword,agentstatus;
		private boolean valid;

		
		public String getAgentid() {
			return agentid;
		}
		public void setAgentid(String agentid) {
			this.agentid = agentid;
		}
		public String getAgentname() {
			return agentname;
		}
		public void setAgentname(String agentname) {
			this.agentname = agentname;
		}
		public String getAgentgender() {
			return agentgender;
		}
		public void setAgentgender(String agentgender) {
			this.agentgender = agentgender;
		}
		public String getAgentphoneno() {
			return agentphoneno;
		}
		public void setAgentphoneno(String agentphoneno) {
			this.agentphoneno = agentphoneno;
		}
		public String getAgentaddress() {
			return agentaddress;
		}
		public void setAgentaddress(String agentaddress) {
			this.agentaddress = agentaddress;
		}
		public String getAgentemail() {
			return agentemail;
		}
		public void setAgentemail(String agentemail) {
			this.agentemail = agentemail;
		}
		public Date getAgentDateAssign() {
			return agentDateAssign;
		}
		public void setAgentDateAssign(Date agentDateAssign) {
			this.agentDateAssign = agentDateAssign;
		}
		public String getAgentpassword() {
			return agentpassword;
		}
		public void setAgentpassword(String agentpassword) {
			this.agentpassword = agentpassword;
		}
		public String getAgentstatus() {
			return agentstatus;
		}
		public void setAgentstatus(String agentstatus) {
			this.agentstatus = agentstatus;
		}
		public boolean isValid() {
			return valid;
		}

		public void setValid(boolean valid) {
			this.valid = valid;
		}
		
}
