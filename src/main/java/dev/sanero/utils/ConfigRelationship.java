package dev.sanero.utils;

public class ConfigRelationship {
	@Override
	public String toString() {
		return "ConfigRelationship [ramId=" + ramId + ", cpuId=" + cpuId + ", producerId=" + producerId + "]";
	}

	public int getRamId() {
		return ramId;
	}

	public void setRamId(int ramId) {
		this.ramId = ramId;
	}

	public int getCpuId() {
		return cpuId;
	}

	public void setCpuId(int cpuId) {
		this.cpuId = cpuId;
	}

	public int getProducerId() {
		return producerId;
	}

	public void setProducerId(int producerId) {
		this.producerId = producerId;
	}

	private int ramId;
	private int cpuId;
	private int producerId;
}
