package egovframework.itman.hardware.service;

public class HardwareVO {
    private String hwIdx;
    private String assIdx;
    private String os;
    private String cpu;
    private String baseboard;
    private String memory;
    private String disk;
    private String graphicds;
    private String uuid;

    public String getHwIdx() {
        return hwIdx;
    }

    public void setHwIdx(String hwIdx) {
        this.hwIdx = hwIdx;
    }

    public String getAssIdx() {
        return assIdx;
    }

    public void setAssIdx(String assIdx) {
        this.assIdx = assIdx;
    }

    public String getOs() {
        return os;
    }

    public void setOs(String os) {
        this.os = os;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getBaseboard() {
        return baseboard;
    }

    public void setBaseboard(String baseboard) {
        this.baseboard = baseboard;
    }

    public String getMemory() {
        return memory;
    }

    public void setMemory(String memory) {
        this.memory = memory;
    }

    public String getDisk() {
        return disk;
    }

    public void setDisk(String disk) {
        this.disk = disk;
    }

    public String getGraphicds() {
        return graphicds;
    }

    public void setGraphicds(String graphicds) {
        this.graphicds = graphicds;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
}
