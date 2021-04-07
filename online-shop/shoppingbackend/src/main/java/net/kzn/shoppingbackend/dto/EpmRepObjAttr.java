package net.kzn.shoppingbackend.dto;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "EPM_REP_OBJ_ATTR")
public class EpmRepObjAttr implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	@Column(name = "REP_ATTR_INST_ID")
	private int repAttrInstId;
	
	@Column(name = "REP_OBJ_INST_ID")
	private int repObjInstId;
	
	@Column(name = "ATTR_NAME")
	private String attrName;
	
	@Column(name = "DEF_DISP_NAME")
	private String defDispName;
	
	@Column(name = "PREF_DISP_NAME")
	private String prefDispName;
	
	public int getRepAttrInstId() {
		return repAttrInstId;
	}

	public void setRepAttrInstId(int repAttrInstId) {
		this.repAttrInstId = repAttrInstId;
	}
	
	public int getRepObjInstId() {
		return repObjInstId;
	}

	public void setRepObjInstId(int repObjInstId) {
		this.repObjInstId = repObjInstId;
	}

	public String getAttrName() {
		return attrName;
	}

	public void setAttrName(String attrName) {
		this.attrName = attrName;
	}
	
	public String getDefDispName() {
		return defDispName;
	}

	public void setDefDispName(String defDispName) {
		this.defDispName = defDispName;
	}
	
	public String getPrefDispName() {
		return prefDispName;
	}

	public void setPrefDispName(String prefDispName) {
		this.prefDispName = prefDispName;
	}

	@Override
	public String toString() {
		return "EpmRepObjAttr [repAttrInstId=" + repAttrInstId + ", repObjInstId=" + repObjInstId + ",attrName=" + attrName + ", defDispName=" + defDispName + ", prefDispName=" + prefDispName + "]";
	}
	
}